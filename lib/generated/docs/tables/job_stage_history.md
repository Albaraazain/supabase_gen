# JobStageHistoryModel Documentation

## Table: job_stage_history

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `history_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `job_id` | `uuid` | No | None | Not Null |
| `from_stage` | `text` | Yes | None | - |
| `to_stage` | `text` | No | None | Not Null |
| `changed_by` | `uuid` | Yes | None | - |
| `notes` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByHistoryId(history_id)` - Returns a single record(s)
- `getByHistoryId(history_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final job_stage_history = JobStageHistoryModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Job_stage_historyRepository(client);
final savedId = await repository.create(job_stage_history);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
