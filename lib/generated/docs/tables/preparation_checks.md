# PreparationChecksModel Documentation

## Table: preparation_checks

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `check_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `job_id` | `uuid` | No | None | Not Null |
| `check_name` | `text` | No | None | Not Null |
| `status` | `text` | No | 'pending'::text | Not Null |
| `notes` | `text` | Yes | None | - |
| `performed_by` | `uuid` | Yes | None | - |
| `performed_at` | `timestamp with time zone` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByCheckId(check_id)` - Returns a single record(s)
- `getByCheckId(check_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final preparation_checks = PreparationChecksModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Preparation_checksRepository(client);
final savedId = await repository.create(preparation_checks);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
