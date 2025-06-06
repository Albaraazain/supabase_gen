# MessagesModel Documentation

## Table: messages

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `trip_id` | `uuid` | No | None | Not Null, Foreign Key → trips(id) |
| `sender_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `recipient_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `booking_id` | `uuid` | Yes | None | Foreign Key → bookings(id) |
| `message_type` | `text` | Yes | 'text'::text | - |
| `content` | `text` | No | None | Not Null |
| `metadata` | `jsonb` | Yes | '{}'::jsonb | - |
| `is_read` | `boolean` | Yes | false | - |
| `read_at` | `timestamp with time zone` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **bookings** via `booking_id` → `id`
- **profiles** via `recipient_id` → `id`
- **profiles** via `sender_id` → `id`
- **trips** via `trip_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByBookingId(booking_id)` - Returns multiple record(s)
- `getByRecipientId(recipient_id)` - Returns multiple record(s)
- `getBySenderId(sender_id)` - Returns multiple record(s)
- `getByTripId(trip_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final messages = MessagesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = MessagesRepository(client);
final savedId = await repository.create(messages);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
