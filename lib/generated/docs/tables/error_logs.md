# ErrorLogsModel Documentation

## Table: error_logs

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `log_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `error_message` | `text` | No | None | Not Null |
| `error_details` | `text` | Yes | None | - |
| `source` | `text` | Yes | None | - |
| `user_id` | `uuid` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByLogId(log_id)` - Returns a single record(s)
- `getByLogId(log_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final error_logs = ErrorLogsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Error_logsRepository(client);
final savedId = await repository.create(error_logs);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
