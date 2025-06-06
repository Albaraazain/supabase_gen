# BookingsModel Documentation

## Table: bookings

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `trip_id` | `uuid` | No | None | Not Null, Foreign Key → trips(id) |
| `ride_request_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → ride_requests(id) |
| `passenger_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `driver_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `seats_booked` | `integer` | No | None | Not Null |
| `final_price` | `numeric` | No | None | Not Null |
| `booking_status` | `text` | Yes | 'confirmed'::text | - |
| `pickup_code` | `text` | Yes | substr(md5((random())::text), 1, 6) | - |
| `payment_status` | `text` | Yes | 'pending'::text | - |
| `payment_method` | `text` | Yes | None | - |
| `cancelled_by` | `uuid` | Yes | None | Foreign Key → profiles(id) |
| `cancellation_reason` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `picked_up_at` | `timestamp with time zone` | Yes | None | - |
| `completed_at` | `timestamp with time zone` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `cancelled_by` → `id`
- **profiles** via `driver_id` → `id`
- **profiles** via `passenger_id` → `id`
- **ride_requests** via `ride_request_id` → `id`
- **trips** via `trip_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByRideRequestId(ride_request_id)` - Returns a single record(s)
- `getByCancelledBy(cancelled_by)` - Returns multiple record(s)
- `getByDriverId(driver_id)` - Returns multiple record(s)
- `getByPassengerId(passenger_id)` - Returns multiple record(s)
- `getByRideRequestId(ride_request_id)` - Returns multiple record(s)
- `getByTripId(trip_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final bookings = BookingsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = BookingsRepository(client);
final savedId = await repository.create(bookings);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
