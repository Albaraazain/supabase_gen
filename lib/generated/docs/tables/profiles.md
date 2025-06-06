# ProfilesModel Documentation

## Table: profiles

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | None | Primary Key, Not Null |
| `email` | `text` | No | None | Unique, Not Null |
| `phone` | `text` | Yes | None | Unique |
| `full_name` | `text` | No | None | Not Null |
| `avatar_url` | `text` | Yes | None | - |
| `date_of_birth` | `date` | Yes | None | - |
| `gender` | `text` | Yes | None | - |
| `bio` | `text` | Yes | None | - |
| `is_verified` | `boolean` | Yes | false | - |
| `verification_status` | `text` | Yes | 'pending'::text | - |
| `driver_rating` | `numeric` | Yes | 0.0 | - |
| `passenger_rating` | `numeric` | Yes | 0.0 | - |
| `total_trips_as_driver` | `integer` | Yes | 0 | - |
| `total_trips_as_passenger` | `integer` | Yes | 0 | - |
| `preferred_language` | `text` | Yes | 'en'::text | - |
| `emergency_contact_name` | `text` | Yes | None | - |
| `emergency_contact_phone` | `text` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `last_active_at` | `timestamp with time zone` | Yes | now() | - |
| `is_banned` | `boolean` | Yes | false | - |
| `ban_reason` | `text` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByEmail(email)` - Returns a single record(s)
- `getByPhone(phone)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final profiles = ProfilesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = ProfilesRepository(client);
final savedId = await repository.create(profiles);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
