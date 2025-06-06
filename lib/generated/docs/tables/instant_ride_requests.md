# InstantRideRequestsModel Documentation

## Table: instant_ride_requests

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `passenger_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `pickup_address` | `text` | No | None | Not Null |
| `pickup_lat` | `numeric` | No | None | Not Null |
| `pickup_lng` | `numeric` | No | None | Not Null |
| `pickup_point` | `USER-DEFINED` | Yes | None | - |
| `destination_address` | `text` | No | None | Not Null |
| `destination_lat` | `numeric` | No | None | Not Null |
| `destination_lng` | `numeric` | No | None | Not Null |
| `destination_point` | `USER-DEFINED` | Yes | None | - |
| `estimated_distance_km` | `numeric` | Yes | None | - |
| `estimated_duration_minutes` | `integer` | Yes | None | - |
| `offered_fare` | `numeric` | No | None | Not Null |
| `max_fare_willingness` | `numeric` | Yes | None | - |
| `surge_multiplier` | `numeric` | Yes | 1.0 | - |
| `seats_requested` | `integer` | Yes | 1 | - |
| `search_radius_km` | `numeric` | Yes | 5.0 | - |
| `status` | `text` | Yes | 'searching'::text | - |
| `matched_driver_id` | `uuid` | Yes | None | Foreign Key → profiles(id) |
| `driver_response_deadline` | `timestamp without time zone` | Yes | None | - |
| `special_requests` | `text` | Yes | None | - |
| `requested_at` | `timestamp without time zone` | Yes | now() | - |
| `expires_at` | `timestamp without time zone` | Yes | (now() + '00:05:00'::interval) | - |
| `matched_at` | `timestamp without time zone` | Yes | None | - |
| `accepted_at` | `timestamp without time zone` | Yes | None | - |
| `completed_at` | `timestamp without time zone` | Yes | None | - |
| `cancelled_at` | `timestamp without time zone` | Yes | None | - |
| `cancellation_reason` | `text` | Yes | None | - |
| `cancellation_by` | `text` | Yes | None | - |
| `created_at` | `timestamp without time zone` | Yes | now() | - |
| `updated_at` | `timestamp without time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `matched_driver_id` → `id`
- **profiles** via `passenger_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByMatchedDriverId(matched_driver_id)` - Returns multiple record(s)
- `getByPassengerId(passenger_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final instant_ride_requests = InstantRideRequestsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Instant_ride_requestsRepository(client);
final savedId = await repository.create(instant_ride_requests);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
