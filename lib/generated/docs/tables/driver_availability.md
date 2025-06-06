# DriverAvailabilityModel Documentation

## Table: driver_availability

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `driver_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → profiles(id) |
| `is_available_for_instant_rides` | `boolean` | Yes | false | - |
| `max_pickup_distance_km` | `numeric` | Yes | 3.0 | - |
| `preferred_ride_types` | `text[]` | Yes | ARRAY['standard'::text] | - |
| `auto_accept_rides` | `boolean` | Yes | false | - |
| `minimum_fare` | `numeric` | Yes | 10.0 | - |
| `maximum_passengers` | `integer` | Yes | 4 | - |
| `accepts_pets` | `boolean` | Yes | false | - |
| `accepts_smoking` | `boolean` | Yes | false | - |
| `vehicle_amenities` | `text[]` | Yes | None | - |
| `preferred_payment_methods` | `text[]` | Yes | ARRAY['cash'::text, 'card'::text] | - |
| `surge_multiplier_threshold` | `numeric` | Yes | 2.0 | - |
| `break_time_start` | `time without time zone` | Yes | None | - |
| `break_time_end` | `time without time zone` | Yes | None | - |
| `current_location_lat` | `numeric` | Yes | None | - |
| `current_location_lng` | `numeric` | Yes | None | - |
| `current_location_point` | `USER-DEFINED` | Yes | None | - |
| `heading` | `numeric` | Yes | None | - |
| `speed_kmh` | `numeric` | Yes | None | - |
| `battery_level` | `integer` | Yes | None | - |
| `fuel_level_percent` | `integer` | Yes | None | - |
| `last_ride_completed_at` | `timestamp without time zone` | Yes | None | - |
| `available_from` | `time without time zone` | Yes | '06:00:00'::time without time zone | - |
| `available_until` | `time without time zone` | Yes | '23:00:00'::time without time zone | - |
| `available_days` | `int4[]` | Yes | ARRAY[1, 2, 3, 4, 5, 6, 7] | - |
| `created_at` | `timestamp without time zone` | Yes | now() | - |
| `updated_at` | `timestamp without time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `driver_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByDriverId(driver_id)` - Returns a single record(s)
- `getByDriverId(driver_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final driver_availability = DriverAvailabilityModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Driver_availabilityRepository(client);
final savedId = await repository.create(driver_availability);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
