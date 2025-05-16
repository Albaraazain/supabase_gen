# TestJobsModel Documentation

## Table: test_jobs

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `job_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `name` | `text` | No | None | Not Null |
| `description` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

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
final test_jobs = TestJobsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Test_jobsRepository(client);
final savedId = await repository.create(test_jobs);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
