# QuotePhaseModel Documentation

## Table: quote_phase

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `job_id` | `uuid` | No | None | Primary Key, Not Null |
| `quote_created_at` | `timestamp with time zone` | No | None | Not Null |
| `quote_submitted_at` | `timestamp with time zone` | Yes | None | - |
| `quote_accepted_at` | `timestamp with time zone` | Yes | None | - |
| `total_amount` | `numeric` | Yes | None | - |
| `validity_days` | `integer` | Yes | None | - |

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
final quote_phase = QuotePhaseModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Quote_phaseRepository(client);
final savedId = await repository.create(quote_phase);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
