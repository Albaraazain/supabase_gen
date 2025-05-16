# ServicesModel Documentation

## Table: services

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `service_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `category_id` | `uuid` | Yes | None | - |
| `name` | `text` | No | None | Not Null |
| `description` | `text` | Yes | None | - |
| `base_price` | `numeric` | Yes | None | - |
| `price_unit` | `text` | Yes | None | - |
| `estimated_duration` | `integer` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByServiceId(service_id)` - Returns a single record(s)
- `getByServiceId(service_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final services = ServicesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = ServicesRepository(client);
final savedId = await repository.create(services);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
