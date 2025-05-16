# ProfessionalEarningsModel Documentation

## Table: professional_earnings

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `earning_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `professional_id` | `uuid` | No | None | Not Null |
| `job_id` | `uuid` | No | None | Not Null |
| `amount` | `numeric` | No | None | Not Null |
| `earnings_date` | `timestamp with time zone` | Yes | now() | - |
| `status` | `text` | Yes | 'pending'::text | - |
| `payout_date` | `timestamp with time zone` | Yes | None | - |
| `transaction_id` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByEarningId(earning_id)` - Returns a single record(s)
- `getByEarningId(earning_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final professional_earnings = ProfessionalEarningsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Professional_earningsRepository(client);
final savedId = await repository.create(professional_earnings);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
