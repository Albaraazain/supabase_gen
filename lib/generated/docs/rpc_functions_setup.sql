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
    c.data_type::text AS col_type,
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
