# JobsModel Documentation

## Table: jobs

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `job_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `broadcast_id` | `uuid` | Yes | None | - |
| `homeowner_id` | `uuid` | No | None | Not Null |
| `professional_id` | `uuid` | No | None | Not Null |
| `service_id` | `uuid` | No | None | Not Null |
| `stage_updated_at` | `timestamp with time zone` | Yes | None | - |
| `scheduled_time` | `timestamp with time zone` | Yes | None | - |
| `estimated_duration` | `integer` | Yes | None | - |
| `current_stage` | `text` | No | None | Not Null |
| `work_started_at` | `timestamp with time zone` | Yes | None | - |
| `work_paused_at` | `timestamp with time zone` | Yes | None | - |
| `total_pause_duration` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `last_updated_by` | `uuid` | Yes | None | - |
| `current_session_id` | `uuid` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByJobId(job_id)` - Returns a single record(s)
- `getByJobId(job_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final jobs = JobsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = JobsRepository(client);
final savedId = await repository.create(jobs);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
