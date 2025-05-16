# HomeownerLocationUpdatesModel Documentation

## Table: homeowner_location_updates

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `homeowner_id` | `uuid` | No | None | Unique, Not Null |
| `latitude` | `double precision` | No | None | Not Null |
| `longitude` | `double precision` | No | None | Not Null |
| `created_at` | `timestamp with time zone` | No | timezone('utc'::text, now()) | Unique, Not Null |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByHomeownerId(homeowner_id)` - Returns a single record(s)
- `getByCreatedAt(created_at)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final homeowner_location_updates = HomeownerLocationUpdatesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Homeowner_location_updatesRepository(client);
final savedId = await repository.create(homeowner_location_updates);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
