# DiagnosisPhaseModel Documentation

## Table: diagnosis_phase

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `job_id` | `uuid` | No | None | Primary Key, Not Null |
| `diagnosis_started_at` | `timestamp with time zone` | No | None | Not Null |
| `diagnosis_ended_at` | `timestamp with time zone` | Yes | None | - |
| `findings_summary` | `text` | Yes | None | - |
| `recommended_actions` | `ARRAY` | Yes | None | - |

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
final diagnosis_phase = DiagnosisPhaseModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Diagnosis_phaseRepository(client);
final savedId = await repository.create(diagnosis_phase);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
