# ProfessionalResponsesModel Documentation

## Table: professional_responses

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `response_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `broadcast_id` | `uuid` | Yes | None | - |
| `professional_id` | `uuid` | Yes | None | - |
| `price` | `numeric` | Yes | None | - |
| `arrival_window_start` | `timestamp with time zone` | Yes | None | - |
| `arrival_window_end` | `timestamp with time zone` | Yes | None | - |
| `estimated_duration` | `integer` | Yes | None | - |
| `notes` | `text` | Yes | None | - |
| `status` | `text` | Yes | 'pending'::text | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByResponseId(response_id)` - Returns a single record(s)
- `getByResponseId(response_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final professional_responses = ProfessionalResponsesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Professional_responsesRepository(client);
final savedId = await repository.create(professional_responses);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
