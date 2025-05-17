# PostgreSQL Function Introspection Examples

This document provides examples of using the advanced function introspection utilities in Supabase Gen. These examples show how to extract function definitions, signatures, and trigger relationships.

## 1. Getting Function Details

To get details about a specific function, use the `get_function_details` function:

```sql
SELECT * FROM get_function_details('update_modified_timestamp');
```

This returns:
- function_id: The OID of the function
- schema_name: The schema where the function is defined
- function_name: The name of the function
- complete_signature: The full function signature
- parameters: Parameters the function accepts
- return_type: The return type of the function
- function_definition: The complete CREATE FUNCTION definition 
- function_body: Just the body of the function between delimiter tags
- language_name: The implementation language (e.g., plpgsql, sql)
- volatility: Whether the function is IMMUTABLE, STABLE, or VOLATILE
- comment: Any comments on the function
- is_strict: Whether the function returns NULL for NULL inputs

## 2. Working with Overloaded Functions

If a function is overloaded (same name, different parameters), you can use `get_function_details_by_signature`:

```sql
SELECT * FROM get_function_details_by_signature(
    'handle_notification', 
    ARRAY['16414 16414']  -- Parameter types represented as OIDs
);
```

## 3. Finding Triggers that Use a Function

To find all triggers that call a specific function:

```sql
SELECT * FROM get_triggers_for_function('update_modified_timestamp');
```

This shows every trigger that uses the specified function, along with details about which tables use the trigger and when it fires.

## 4. Integration with Supabase Gen

In Supabase Gen, these functions are used for trigger documentation. When documenting database tables, the system can now show not just that a trigger exists, but exactly what the trigger function does:

```dart
// Example model documentation with trigger information
/// Represents a work_session in the database
/// ...
/// Database triggers associated with this table:
/// - update_work_session_timestamp: UPDATE BEFORE - EXECUTE FUNCTION update_modified_time()
///   Function body: BEGIN NEW.updated_at := now(); RETURN NEW; END;
```

This provides developers with more context about how triggers affect database operations when using generated models.

## 5. Security Considerations

All introspection functions are created with `SECURITY DEFINER` to ensure they have appropriate permissions to read catalog tables. When deployed to Supabase, they use Postgres Row Level Security (RLS) to restrict access appropriately.

## 6. Examples in Schema Reader

The SchemaReader component of Supabase Gen uses these functions to extract trigger information when generating models:

```dart
final functionDetails = await _getFunctionDetails(functionName);
if (functionDetails.isNotEmpty) {
  final details = functionDetails.first;
  functionDefinition = details['function_body'] as String?;
  functionParameters = details['parameters'] as String?;
  // ...
}
```

This allows for robust extraction of function details regardless of how the function is defined in PostgreSQL.