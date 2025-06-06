# ReviewsModel Documentation

## Table: reviews

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `booking_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → bookings(id) |
| `reviewer_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → profiles(id) |
| `reviewed_user_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `reviewer_role` | `text` | No | None | Unique, Not Null |
| `rating` | `integer` | No | None | Not Null |
| `comment` | `text` | Yes | None | - |
| `is_recommended` | `boolean` | Yes | true | - |
| `safety_rating` | `integer` | Yes | None | - |
| `cleanliness_rating` | `integer` | Yes | None | - |
| `punctuality_rating` | `integer` | Yes | None | - |
| `communication_rating` | `integer` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **bookings** via `booking_id` → `id`
- **profiles** via `reviewed_user_id` → `id`
- **profiles** via `reviewer_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByBookingId(booking_id)` - Returns a single record(s)
- `getByReviewerId(reviewer_id)` - Returns a single record(s)
- `getByReviewerRole(reviewer_role)` - Returns a single record(s)
- `getByBookingId(booking_id)` - Returns multiple record(s)
- `getByReviewedUserId(reviewed_user_id)` - Returns multiple record(s)
- `getByReviewerId(reviewer_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final reviews = ReviewsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = ReviewsRepository(client);
final savedId = await repository.create(reviews);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
