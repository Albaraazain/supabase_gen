# WorkingPhaseModel Documentation

## Table: working_phase

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `job_id` | `uuid` | No | None | Primary Key, Not Null |
| `work_started_at` | `timestamp with time zone` | No | None | Not Null |
| `work_paused_at` | `timestamp with time zone` | Yes | None | - |
| `total_pause_duration` | `interval` | Yes | None | - |
| `current_session_id` | `uuid` | Yes | None | - |
| `completion_percentage` | `double precision` | Yes | None | - |

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
final working_phase = WorkingPhaseModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Working_phaseRepository(client);
final savedId = await repository.create(working_phase);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
