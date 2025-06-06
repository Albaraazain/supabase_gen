# VehiclesModel Documentation

## Table: vehicles

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `user_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `make` | `text` | No | None | Not Null |
| `model` | `text` | No | None | Not Null |
| `year` | `integer` | Yes | None | - |
| `color` | `text` | Yes | None | - |
| `license_plate` | `text` | Yes | None | Unique |
| `total_seats` | `integer` | No | None | Not Null |
| `vehicle_type` | `text` | Yes | 'car'::text | - |
| `fuel_type` | `text` | Yes | 'petrol'::text | - |
| `fuel_consumption_per_100km` | `numeric` | Yes | None | - |
| `is_verified` | `boolean` | Yes | false | - |
| `verification_documents` | `jsonb` | Yes | '[]'::jsonb | - |
| `is_primary` | `boolean` | Yes | false | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `user_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByLicensePlate(license_plate)` - Returns a single record(s)
- `getByUserId(user_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final vehicles = VehiclesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = VehiclesRepository(client);
final savedId = await repository.create(vehicles);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
