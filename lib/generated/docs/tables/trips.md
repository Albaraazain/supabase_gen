# TripsModel Documentation

## Table: trips

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `driver_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `vehicle_id` | `uuid` | No | None | Not Null, Foreign Key → vehicles(id) |
| `origin_address` | `text` | No | None | Not Null |
| `origin_lat` | `numeric` | No | None | Not Null |
| `origin_lng` | `numeric` | No | None | Not Null |
| `origin_point` | `USER-DEFINED` | Yes | None | - |
| `destination_address` | `text` | No | None | Not Null |
| `destination_lat` | `numeric` | No | None | Not Null |
| `destination_lng` | `numeric` | No | None | Not Null |
| `destination_point` | `USER-DEFINED` | Yes | None | - |
| `departure_time` | `timestamp with time zone` | No | None | Not Null |
| `estimated_arrival_time` | `timestamp with time zone` | Yes | None | - |
| `available_seats` | `integer` | No | None | Not Null |
| `total_distance_km` | `numeric` | Yes | None | - |
| `price_per_seat` | `numeric` | No | None | Not Null |
| `currency` | `text` | Yes | 'USD'::text | - |
| `trip_status` | `text` | Yes | 'scheduled'::text | - |
| `is_recurring` | `boolean` | Yes | false | - |
| `recurring_pattern` | `jsonb` | Yes | None | - |
| `allows_pets` | `boolean` | Yes | false | - |
| `allows_smoking` | `boolean` | Yes | false | - |
| `allows_music` | `boolean` | Yes | true | - |
| `max_luggage_size` | `text` | Yes | 'medium'::text | - |
| `notes` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `started_at` | `timestamp with time zone` | Yes | None | - |
| `completed_at` | `timestamp with time zone` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `driver_id` → `id`
- **vehicles** via `vehicle_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByDriverId(driver_id)` - Returns multiple record(s)
- `getByVehicleId(vehicle_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final trips = TripsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = TripsRepository(client);
final savedId = await repository.create(trips);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
