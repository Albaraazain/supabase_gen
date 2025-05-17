-- Advanced Function Introspection for Supabase Gen
-- This function provides detailed information about PostgreSQL functions
-- including overloaded functions, complete signatures, and metadata.

CREATE OR REPLACE FUNCTION public.get_function_details(p_function_name text)
RETURNS TABLE (
    function_id oid,
    schema_name text,
    function_name text,
    complete_signature text,
    parameters text,
    return_type text,
    function_definition text,
    function_body text,
    language_name text,
    volatility text,
    comment text,
    is_strict boolean
) 
SECURITY DEFINER
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.oid::oid AS function_id,
        n.nspname::text AS schema_name,
        p.proname::text AS function_name,
        p.proname || '(' || pg_get_function_arguments(p.oid) || ')' AS complete_signature,
        pg_get_function_arguments(p.oid)::text AS parameters,
        format_type(p.prorettype, NULL)::text AS return_type,
        pg_get_functiondef(p.oid)::text AS function_definition,
        -- Extract function body between $$ markers
        SUBSTRING(
            pg_get_functiondef(p.oid) 
            FROM 
                CASE 
                    WHEN POSITION('$BODY$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$BODY$' IN pg_get_functiondef(p.oid)) + 6
                    WHEN POSITION('$$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$$' IN pg_get_functiondef(p.oid)) + 2
                    ELSE 0
                END
            FOR 
                CASE 
                    WHEN POSITION('$BODY$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$BODY$' IN SUBSTRING(pg_get_functiondef(p.oid) FROM POSITION('$BODY$' IN pg_get_functiondef(p.oid)) + 6)) - 1
                    WHEN POSITION('$$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$$' IN SUBSTRING(pg_get_functiondef(p.oid) FROM POSITION('$$' IN pg_get_functiondef(p.oid)) + 2)) - 1
                    ELSE 0
                END
        )::text AS function_body,
        l.lanname::text AS language_name,
        CASE 
            WHEN p.provolatile = 'i' THEN 'IMMUTABLE'
            WHEN p.provolatile = 's' THEN 'STABLE'
            WHEN p.provolatile = 'v' THEN 'VOLATILE'
            ELSE 'UNKNOWN'
        END AS volatility,
        d.description::text AS comment,
        p.proisstrict AS is_strict
    FROM 
        pg_proc p
        JOIN pg_namespace n ON p.pronamespace = n.oid
        JOIN pg_language l ON p.prolang = l.oid
        LEFT JOIN pg_description d ON p.oid = d.objoid AND d.objsubid = 0
    WHERE 
        p.proname = p_function_name
        AND n.nspname NOT IN ('pg_catalog', 'information_schema')
    ORDER BY 
        n.nspname, p.proname, p.oid;
END;
$$;

-- Function to get details for a specific function with a specific signature (for overloaded functions)
CREATE OR REPLACE FUNCTION public.get_function_details_by_signature(
    p_function_name text,
    p_parameter_types text[] DEFAULT NULL
)
RETURNS TABLE (
    function_id oid,
    schema_name text,
    function_name text,
    complete_signature text,
    parameters text,
    return_type text,
    function_definition text,
    function_body text,
    language_name text,
    volatility text,
    comment text,
    is_strict boolean
) 
SECURITY DEFINER
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.oid::oid AS function_id,
        n.nspname::text AS schema_name,
        p.proname::text AS function_name,
        p.proname || '(' || pg_get_function_arguments(p.oid) || ')' AS complete_signature,
        pg_get_function_arguments(p.oid)::text AS parameters,
        format_type(p.prorettype, NULL)::text AS return_type,
        pg_get_functiondef(p.oid)::text AS function_definition,
        -- Extract function body between $$ markers 
        SUBSTRING(
            pg_get_functiondef(p.oid) 
            FROM 
                CASE 
                    WHEN POSITION('$BODY$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$BODY$' IN pg_get_functiondef(p.oid)) + 6
                    WHEN POSITION('$$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$$' IN pg_get_functiondef(p.oid)) + 2
                    ELSE 0
                END
            FOR 
                CASE 
                    WHEN POSITION('$BODY$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$BODY$' IN SUBSTRING(pg_get_functiondef(p.oid) FROM POSITION('$BODY$' IN pg_get_functiondef(p.oid)) + 6)) - 1
                    WHEN POSITION('$$' IN pg_get_functiondef(p.oid)) > 0 
                         THEN POSITION('$$' IN SUBSTRING(pg_get_functiondef(p.oid) FROM POSITION('$$' IN pg_get_functiondef(p.oid)) + 2)) - 1
                    ELSE 0
                END
        )::text AS function_body,
        l.lanname::text AS language_name,
        CASE 
            WHEN p.provolatile = 'i' THEN 'IMMUTABLE'
            WHEN p.provolatile = 's' THEN 'STABLE'
            WHEN p.provolatile = 'v' THEN 'VOLATILE'
            ELSE 'UNKNOWN'
        END AS volatility,
        d.description::text AS comment,
        p.proisstrict AS is_strict
    FROM 
        pg_proc p
        JOIN pg_namespace n ON p.pronamespace = n.oid
        JOIN pg_language l ON p.prolang = l.oid
        LEFT JOIN pg_description d ON p.oid = d.objoid AND d.objsubid = 0
    WHERE 
        p.proname = p_function_name
        AND n.nspname NOT IN ('pg_catalog', 'information_schema')
        AND (p_parameter_types IS NULL OR p.proargtypes::text = ANY(p_parameter_types))
    ORDER BY 
        n.nspname, p.proname, p.oid;
END;
$$;

-- Function to get all triggers that call a specific function
CREATE OR REPLACE FUNCTION public.get_triggers_for_function(p_function_name text)
RETURNS TABLE (
    trigger_name text,
    table_schema text,
    table_name text,
    event_manipulation text,
    action_timing text,
    action_statement text
)
SECURITY DEFINER
LANGUAGE sql
AS $$
    SELECT 
        trigger_name::text,
        event_object_schema::text AS table_schema,
        event_object_table::text AS table_name,
        event_manipulation::text,
        action_timing::text,
        action_statement::text
    FROM 
        information_schema.triggers
    WHERE 
        action_statement LIKE '%' || p_function_name || '(%'
    ORDER BY 
        event_object_schema, event_object_table, trigger_name;
$$;