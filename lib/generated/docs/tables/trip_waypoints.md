# TripWaypointsModel Documentation

## Table: trip_waypoints

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `trip_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → trips(id) |
| `address` | `text` | No | None | Not Null |
| `lat` | `numeric` | No | None | Not Null |
| `lng` | `numeric` | No | None | Not Null |
| `point` | `USER-DEFINED` | Yes | None | - |
| `order_index` | `integer` | No | None | Unique, Not Null |
| `estimated_arrival_time` | `timestamp with time zone` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **trips** via `trip_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByTripId(trip_id)` - Returns a single record(s)
- `getByOrderIndex(order_index)` - Returns a single record(s)
- `getByTripId(trip_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final trip_waypoints = TripWaypointsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Trip_waypointsRepository(client);
final savedId = await repository.create(trip_waypoints);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
