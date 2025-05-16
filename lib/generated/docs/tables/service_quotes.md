# ServiceQuotesModel Documentation

## Table: service_quotes

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `quote_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `job_id` | `uuid` | No | None | Not Null |
| `total_amount` | `numeric` | No | None | Not Null |
| `status` | `text` | Yes | 'pending'::text | - |
| `valid_until` | `timestamp with time zone` | Yes | None | - |
| `notes` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `created_by` | `uuid` | Yes | None | - |
| `accepted_at` | `timestamp with time zone` | Yes | None | - |
| `accepted_by` | `uuid` | Yes | None | - |
| `rejection_reason` | `text` | Yes | None | - |
| `rejection_notes` | `text` | Yes | None | - |
| `tax_rate` | `numeric` | No | 0.08 | Not Null |
| `tax_amount` | `numeric` | No | 0 | Not Null |
| `subtotal` | `numeric` | No | 0 | Not Null |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByQuoteId(quote_id)` - Returns a single record(s)
- `getByQuoteId(quote_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final service_quotes = ServiceQuotesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Service_quotesRepository(client);
final savedId = await repository.create(service_quotes);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
