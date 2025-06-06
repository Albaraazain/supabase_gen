# NotificationsModel Documentation

## Table: notifications

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `user_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `type` | `text` | No | None | Not Null |
| `title` | `text` | No | None | Not Null |
| `body` | `text` | No | None | Not Null |
| `data` | `jsonb` | Yes | '{}'::jsonb | - |
| `trip_id` | `uuid` | Yes | None | Foreign Key → trips(id) |
| `booking_id` | `uuid` | Yes | None | Foreign Key → bookings(id) |
| `is_read` | `boolean` | Yes | false | - |
| `read_at` | `timestamp with time zone` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **bookings** via `booking_id` → `id`
- **trips** via `trip_id` → `id`
- **profiles** via `user_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByBookingId(booking_id)` - Returns multiple record(s)
- `getByTripId(trip_id)` - Returns multiple record(s)
- `getByUserId(user_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final notifications = NotificationsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = NotificationsRepository(client);
final savedId = await repository.create(notifications);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
