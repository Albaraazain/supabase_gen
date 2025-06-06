# RideRequestsModel Documentation

## Table: ride_requests

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `trip_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → trips(id) |
| `passenger_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → profiles(id) |
| `seats_requested` | `integer` | No | 1 | Not Null |
| `pickup_address` | `text` | Yes | None | - |
| `pickup_lat` | `numeric` | Yes | None | - |
| `pickup_lng` | `numeric` | Yes | None | - |
| `pickup_point` | `USER-DEFINED` | Yes | None | - |
| `dropoff_address` | `text` | Yes | None | - |
| `dropoff_lat` | `numeric` | Yes | None | - |
| `dropoff_lng` | `numeric` | Yes | None | - |
| `dropoff_point` | `USER-DEFINED` | Yes | None | - |
| `offered_price_per_seat` | `numeric` | No | None | Not Null |
| `total_offered_price` | `numeric` | Yes | None | - |
| `status` | `text` | Yes | 'pending'::text | - |
| `message_to_driver` | `text` | Yes | None | - |
| `driver_response_message` | `text` | Yes | None | - |
| `requested_at` | `timestamp with time zone` | Yes | now() | - |
| `responded_at` | `timestamp with time zone` | Yes | None | - |
| `expires_at` | `timestamp with time zone` | Yes | (now() + '24:00:00'::interval) | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `passenger_id` → `id`
- **trips** via `trip_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByTripId(trip_id)` - Returns a single record(s)
- `getByPassengerId(passenger_id)` - Returns a single record(s)
- `getByPassengerId(passenger_id)` - Returns multiple record(s)
- `getByTripId(trip_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final ride_requests = RideRequestsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Ride_requestsRepository(client);
final savedId = await repository.create(ride_requests);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
