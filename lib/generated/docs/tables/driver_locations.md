# DriverLocationsModel Documentation

## Table: driver_locations

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `driver_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `latitude` | `double precision` | No | None | Not Null |
| `longitude` | `double precision` | No | None | Not Null |
| `heading` | `double precision` | Yes | None | - |
| `speed` | `double precision` | Yes | None | - |
| `accuracy` | `double precision` | Yes | None | - |
| `is_online` | `boolean` | No | false | Not Null |
| `is_driving` | `boolean` | No | false | Not Null |
| `current_trip_id` | `uuid` | Yes | None | Foreign Key → trips(id) |
| `location_point` | `USER-DEFINED` | Yes | None | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **trips** via `current_trip_id` → `id`
- **profiles** via `driver_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByCurrentTripId(current_trip_id)` - Returns multiple record(s)
- `getByDriverId(driver_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final driver_locations = DriverLocationsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Driver_locationsRepository(client);
final savedId = await repository.create(driver_locations);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
