-- Function to detect generated columns in a table
CREATE OR REPLACE FUNCTION public.get_generated_columns(p_table_name text)
RETURNS TABLE (
    column_name text,
    is_generated text,
    generation_expression text
) 
SECURITY DEFINER
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        c.column_name::text,
        c.is_generated::text,
        c.generation_expression::text
    FROM information_schema.columns c
    WHERE c.table_name = p_table_name
    AND c.table_schema = 'public'
    AND c.is_generated = 'ALWAYS';
END;
$$;

-- Simple lightweight function to get basic function info
CREATE OR REPLACE FUNCTION public.get_function_simple_info(p_function_name text)
RETURNS TABLE (
    function_name text,
    language_name text
) 
SECURITY DEFINER
LANGUAGE sql
AS $$
    SELECT 
        p.proname::text AS function_name,
        l.lanname::text AS language_name
    FROM 
        pg_proc p
        JOIN pg_namespace n ON p.pronamespace = n.oid
        JOIN pg_language l ON p.prolang = l.oid
    WHERE 
        p.proname = p_function_name
        AND n.nspname NOT IN ('pg_catalog', 'information_schema')
    ORDER BY 
        p.proname;
$$;

-- Function to list all tables and views in the public schema
CREATE OR REPLACE FUNCTION public.list_tables()
RETURNS TABLE (table_name text, table_type text) 
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT 
    table_name::text,
    table_type::text
  FROM information_schema.tables
  WHERE table_schema = 'public'
  AND (table_type = 'BASE TABLE' OR table_type = 'VIEW');
$$;

-- Function to get the type of a table (BASE TABLE or VIEW)
CREATE OR REPLACE FUNCTION public.get_table_type(p_table_name text)
RETURNS text 
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT table_type::text
  FROM information_schema.tables
  WHERE table_schema = 'public'
  AND table_name = p_table_name
  LIMIT 1;
$$;

-- Function to get column information for a table
CREATE OR REPLACE FUNCTION public.get_table_columns(p_table_name text)
RETURNS TABLE (
  schema_name text,
  tbl_name text,
  col_name text,
  col_type text,
  max_length integer,
  col_default text,
  nullable text,
  ord_position integer
) 
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT
    c.table_schema::text AS schema_name,
    c.table_name::text AS tbl_name,
    c.column_name::text AS col_name,
    CASE 
      WHEN c.data_type = 'ARRAY' THEN 
        CASE 
          WHEN c.udt_name LIKE '_%' THEN SUBSTRING(c.udt_name FROM 2) || '[]' 
          ELSE c.udt_name || '[]' 
        END 
      ELSE c.data_type 
    END::text AS col_type,
    c.character_maximum_length AS max_length,
    c.column_default::text AS col_default,
    c.is_nullable::text AS nullable,
    c.ordinal_position AS ord_position
  FROM 
    information_schema.columns c
  WHERE 
    c.table_schema = 'public'
    AND c.table_name = p_table_name
  ORDER BY
    c.ordinal_position;
$$;

-- Function to get constraint information for a table
CREATE OR REPLACE FUNCTION public.get_table_constraints(p_table_name text)
RETURNS TABLE (
  schema_name text,
  tbl_name text,
  constraint_name text,
  constraint_type text,
  col_name text,
  ref_table text,
  ref_column text
) 
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT 
    tc.table_schema::text AS schema_name,
    tc.table_name::text AS tbl_name,
    tc.constraint_name::text AS constraint_name,
    tc.constraint_type::text AS constraint_type,
    kcu.column_name::text AS col_name,
    ccu.table_name::text AS ref_table,
    ccu.column_name::text AS ref_column
  FROM 
    information_schema.table_constraints tc
  LEFT JOIN 
    information_schema.key_column_usage kcu
    ON tc.constraint_schema = kcu.constraint_schema 
    AND tc.constraint_name = kcu.constraint_name
  LEFT JOIN 
    information_schema.constraint_column_usage ccu
    ON tc.constraint_schema = ccu.constraint_schema 
    AND tc.constraint_name = ccu.constraint_name
  WHERE 
    tc.table_schema = 'public'
    AND tc.table_name = p_table_name
  ORDER BY
    tc.constraint_name,
    kcu.ordinal_position;
$$;

-- Function to get index information for a table
CREATE OR REPLACE FUNCTION public.get_table_indexes(p_table_name text)
RETURNS TABLE (
  tbl_name text,
  idx_name text,
  col_name text,
  is_unique boolean,
  is_primary boolean
) 
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT
    t.relname::text AS tbl_name,
    i.relname::text AS idx_name,
    a.attname::text AS col_name,
    ix.indisunique AS is_unique,
    ix.indisprimary AS is_primary
  FROM
    pg_index ix
  JOIN
    pg_class i ON i.oid = ix.indexrelid
  JOIN
    pg_class t ON t.oid = ix.indrelid
  JOIN
    pg_attribute a ON a.attrelid = t.oid AND a.attnum = ANY(ix.indkey)
  JOIN
    pg_namespace n ON n.oid = t.relnamespace
  WHERE
    t.relkind = 'r'
    AND n.nspname = 'public'
    AND t.relname = p_table_name
  ORDER BY
    t.relname,
    i.relname;
$$;

-- Function to get trigger information for a table
CREATE OR REPLACE FUNCTION public.get_table_triggers(p_table_name text)
RETURNS TABLE (
  tbl_name text,
  trg_name text,
  event_type text,
  action_time text,
  action_stmt text
) 
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT
    event_object_table::text AS tbl_name,
    trigger_name::text AS trg_name,
    event_manipulation::text AS event_type,
    action_timing::text AS action_time,
    action_statement::text AS action_stmt
  FROM
    information_schema.triggers
  WHERE
    event_object_schema = 'public'
    AND event_object_table = p_table_name
  ORDER BY
    trigger_name;
$$;

-- Function to list all user-defined RPC functions
CREATE OR REPLACE FUNCTION public.list_rpc_functions()
RETURNS TABLE (
  function_name text,
  schema_name text,
  language_name text,
  return_type text,
  is_security_definer boolean,
  volatility text,
  is_strict boolean,
  cost integer,
  estimated_rows integer,
  function_description text
)
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT
    p.proname::text AS function_name,
    n.nspname::text AS schema_name,
    l.lanname::text AS language_name,
    CASE 
      WHEN p.proretset THEN 
        CASE 
          WHEN t.typname = 'record' THEN 'TABLE'
          ELSE 'SETOF ' || t.typname::text
        END
      ELSE t.typname::text
    END AS return_type,
    p.prosecdef AS is_security_definer,
    CASE p.provolatile
      WHEN 'i' THEN 'IMMUTABLE'
      WHEN 's' THEN 'STABLE'
      WHEN 'v' THEN 'VOLATILE'
    END AS volatility,
    p.proisstrict AS is_strict,
    p.procost::integer AS cost,
    CASE WHEN p.proretset THEN p.prorows::integer ELSE NULL END AS estimated_rows,
    obj_description(p.oid, 'pg_proc')::text AS function_description
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid
    JOIN pg_language l ON p.prolang = l.oid
    JOIN pg_type t ON p.prorettype = t.oid
  WHERE 
    n.nspname = 'public'  -- Only include functions in public schema
    AND p.prokind = 'f'  -- Exclude aggregate functions (PostgreSQL 11+)
    AND l.lanname != 'internal'  -- Exclude internal functions
    AND NOT (p.proname LIKE '_%' OR p.proname LIKE 'pg_%' OR p.proname LIKE 'supabase_%' OR p.proname LIKE 'auth.%' OR p.proname LIKE 'storage.%')  -- Exclude internal function names
    AND p.proname NOT IN ('list_tables', 'get_table_type', 'get_table_columns', 'get_table_constraints', 'get_table_indexes', 'get_table_triggers', 
                          'list_rpc_functions', 'get_rpc_function_details', 'get_rpc_function_parameters', 'get_rpc_function_return_columns', 
                          'get_generated_columns', 'get_function_simple_info')  -- Exclude our own helper functions
  ORDER BY 
    n.nspname, p.proname;
$$;

-- Function to get detailed information about a specific RPC function
CREATE OR REPLACE FUNCTION public.get_rpc_function_details(p_function_name text)
RETURNS TABLE (
  function_name text,
  schema_name text,
  language_name text,
  return_type text,
  return_type_category text,
  is_security_definer boolean,
  volatility text,
  is_strict boolean,
  cost integer,
  estimated_rows integer,
  function_description text,
  function_source text,
  is_set_returning boolean,
  parameter_count integer
)
SECURITY DEFINER
LANGUAGE sql
AS $$
  SELECT
    p.proname::text AS function_name,
    n.nspname::text AS schema_name,
    l.lanname::text AS language_name,
    CASE 
      WHEN p.proretset THEN 
        CASE 
          WHEN t.typname = 'record' THEN 'TABLE'
          ELSE 'SETOF ' || t.typname::text
        END
      ELSE t.typname::text
    END AS return_type,
    CASE t.typcategory
      WHEN 'A' THEN 'Array'
      WHEN 'B' THEN 'Boolean'
      WHEN 'C' THEN 'Composite'
      WHEN 'D' THEN 'Date/time'
      WHEN 'E' THEN 'Enum'
      WHEN 'G' THEN 'Geometric'
      WHEN 'I' THEN 'Network address'
      WHEN 'N' THEN 'Numeric'
      WHEN 'P' THEN 'Pseudo-type'
      WHEN 'S' THEN 'String'
      WHEN 'T' THEN 'Timespan'
      WHEN 'U' THEN 'User-defined'
      WHEN 'V' THEN 'Bit-string'
      WHEN 'X' THEN 'Unknown'
      ELSE 'Other'
    END AS return_type_category,
    p.prosecdef AS is_security_definer,
    CASE p.provolatile
      WHEN 'i' THEN 'IMMUTABLE'
      WHEN 's' THEN 'STABLE'
      WHEN 'v' THEN 'VOLATILE'
    END AS volatility,
    p.proisstrict AS is_strict,
    p.procost::integer AS cost,
    CASE WHEN p.proretset THEN p.prorows::integer ELSE NULL END AS estimated_rows,
    obj_description(p.oid, 'pg_proc')::text AS function_description,
    p.prosrc::text AS function_source,
    p.proretset AS is_set_returning,
    p.pronargs::integer AS parameter_count
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid
    JOIN pg_language l ON p.prolang = l.oid
    JOIN pg_type t ON p.prorettype = t.oid
  WHERE 
    p.proname = p_function_name
    AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    AND p.prokind = 'f'  -- Exclude aggregate functions (PostgreSQL 11+)
    AND l.lanname != 'internal'  -- Exclude internal functions
    AND NOT (p.proname LIKE '_%' OR p.proname LIKE 'pg_%' OR p.proname LIKE 'supabase_%' OR p.proname LIKE 'auth.%' OR p.proname LIKE 'storage.%')  -- Exclude internal function names
    AND p.proname NOT IN ('list_tables', 'get_table_type', 'get_table_columns', 'get_table_constraints', 'get_table_indexes', 'get_table_triggers', 
                          'list_rpc_functions', 'get_rpc_function_details', 'get_rpc_function_parameters', 'get_rpc_function_return_columns', 
                          'get_generated_columns', 'get_function_simple_info')  -- Exclude our own helper functions
  ORDER BY 
    n.nspname, p.proname;
$$;

-- Function to get parameter information for a specific RPC function
CREATE OR REPLACE FUNCTION public.get_rpc_function_parameters(p_function_name text)
RETURNS TABLE (
  function_name text,
  parameter_name text,
  parameter_type text,
  parameter_mode text,
  parameter_position integer,
  has_default boolean,
  default_value text,
  is_required boolean
)
SECURITY DEFINER
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN QUERY
  SELECT
    p.proname::text AS function_name,
    CASE 
      WHEN p.proargnames IS NOT NULL AND array_length(p.proargnames, 1) >= pos.i 
      THEN p.proargnames[pos.i]
      ELSE 'param_' || pos.i::text
    END AS parameter_name,
    format_type(unnest_types.arg_type, NULL)::text AS parameter_type,
    CASE 
      WHEN p.proargmodes IS NOT NULL AND array_length(p.proargmodes, 1) >= pos.i THEN
        CASE p.proargmodes[pos.i]
          WHEN 'i' THEN 'IN'
          WHEN 'o' THEN 'OUT'
          WHEN 'b' THEN 'INOUT'
          WHEN 'v' THEN 'VARIADIC'
          WHEN 't' THEN 'TABLE'
          ELSE 'IN'
        END
      ELSE 'IN'
    END AS parameter_mode,
    pos.i AS parameter_position,
    (p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults)) AS has_default,
    CASE 
      WHEN p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults) THEN
        'DEFAULT'  -- We can't easily extract the actual default value
      ELSE NULL
    END AS default_value,
    NOT (p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults)) AS is_required
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid,
    LATERAL (SELECT unnest(p.proargtypes) AS arg_type, generate_series(1, p.pronargs) AS i) AS unnest_types(arg_type, i),
    LATERAL (SELECT unnest_types.i) AS pos(i)
  WHERE 
    p.proname = p_function_name
    AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    AND p.prokind = 'f'  -- Exclude aggregate functions (PostgreSQL 11+)
    AND unnest_types.i <= p.pronargs
  ORDER BY 
    p.proname, pos.i;
END;
$$;

-- Function to get return type information for table-returning functions
CREATE OR REPLACE FUNCTION public.get_rpc_function_return_columns(p_function_name text)
RETURNS TABLE (
  function_name text,
  column_name text,
  column_type text,
  column_position integer
)
SECURITY DEFINER
LANGUAGE plpgsql
AS $$
BEGIN
  -- This function tries to extract column information for functions that return TABLE
  -- It's complex because PostgreSQL doesn't store this information directly
  RETURN QUERY
  SELECT
    p.proname::text AS function_name,
    CASE 
      WHEN p.proargnames IS NOT NULL AND array_length(p.proargnames, 1) >= pos.i 
      THEN p.proargnames[pos.i]
      ELSE 'column_' || pos.i::text
    END AS column_name,
    format_type(out_types.arg_type, NULL)::text AS column_type,
    pos.i AS column_position
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid,
    LATERAL (
      SELECT 
        unnest(
          CASE 
            WHEN p.proargmodes IS NOT NULL THEN 
              -- Filter to only OUT and TABLE parameters
              (SELECT array_agg(p.proargtypes[i-1]) 
               FROM generate_series(1, array_length(p.proargmodes, 1)) i
               WHERE p.proargmodes[i] IN ('o', 't'))
            ELSE ARRAY[]::oid[]
          END
        ) AS arg_type, 
        generate_series(1, 
          CASE 
            WHEN p.proargmodes IS NOT NULL THEN 
              (SELECT count(*) FROM unnest(p.proargmodes) mode WHERE mode IN ('o', 't'))::integer
            ELSE 0
          END
        ) AS i
    ) AS out_types(arg_type, i),
    LATERAL (SELECT out_types.i) AS pos(i)
  WHERE 
    p.proname = p_function_name
    AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    AND p.prokind = 'f'  -- Exclude aggregate functions (PostgreSQL 11+)
    AND p.proretset  -- Only set-returning functions
    AND out_types.arg_type IS NOT NULL
  ORDER BY 
    p.proname, pos.i;
END;
$$;
