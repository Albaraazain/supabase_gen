# UserPreferencesModel Documentation

## Table: user_preferences

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `user_id` | `uuid` | No | None | Unique, Not Null, Foreign Key → profiles(id) |
| `preferred_gender_driver` | `text` | Yes | None | - |
| `preferred_gender_passenger` | `text` | Yes | None | - |
| `max_detour_km` | `integer` | Yes | 10 | - |
| `min_rating_threshold` | `numeric` | Yes | 0.0 | - |
| `auto_accept_threshold` | `numeric` | Yes | None | - |
| `notification_settings` | `jsonb` | Yes | '{"reviews": true, "messages": true, "marketing": false, "ride_requests": true, "trip_reminders": true, "booking_updates": true}'::jsonb | - |
| `privacy_settings` | `jsonb` | Yes | '{"show_phone_after_booking": true, "allow_messages_before_booking": true, "share_trip_with_emergency_contact": false}'::jsonb | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `user_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByUserId(user_id)` - Returns a single record(s)
- `getByUserId(user_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final user_preferences = UserPreferencesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = User_preferencesRepository(client);
final savedId = await repository.create(user_preferences);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
