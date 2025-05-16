# ActiveJobsModel Documentation

## Table: active_jobs

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `job_id` | `uuid` | No | None | Primary Key, Not Null |
| `homeowner_id` | `uuid` | No | None | Not Null |
| `professional_id` | `uuid` | Yes | None | - |
| `service_id` | `uuid` | No | None | Not Null |
| `current_stage` | `text` | No | None | Not Null |
| `created_at` | `timestamp with time zone` | No | now() | Not Null |
| `updated_at` | `timestamp with time zone` | No | now() | Not Null |
| `metadata` | `jsonb` | Yes | None | - |
| `stage_updated_at` | `timestamp with time zone` | Yes | now() | - |
| `scheduled_time` | `timestamp with time zone` | Yes | None | - |
| `estimated_duration` | `integer` | Yes | None | - |
| `stage_notes` | `text` | Yes | None | - |
| `stage_metadata` | `jsonb` | Yes | '{}'::jsonb | - |

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
final active_jobs = ActiveJobsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Active_jobsRepository(client);
final savedId = await repository.create(active_jobs);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
