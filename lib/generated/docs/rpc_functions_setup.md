# Supabase RPC Functions Setup

This document explains how to set up the required RPC functions for the Supabase schema reader.

## Required RPC Functions

The following RPC functions need to be created in your Supabase project to enable remote schema reading:

1. `list_tables()` - Lists all tables in the public schema
2. `get_table_columns(p_table_name text)` - Gets column information for a table
3. `get_table_constraints(p_table_name text)` - Gets constraint information for a table
4. `get_table_indexes(p_table_name text)` - Gets index information for a table
5. `get_table_triggers(p_table_name text)` - Gets trigger information for a table

## Installation

You can install these functions in your Supabase project using the SQL Editor:

1. Open your Supabase project dashboard
2. Go to the SQL Editor
3. Copy and paste the SQL code from the `rpc_functions_setup.sql` file
4. Run the SQL script

The SQL code is available in the accompanying `rpc_functions_setup.sql` file.
