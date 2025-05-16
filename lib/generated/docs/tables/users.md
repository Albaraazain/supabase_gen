# UsersModel Documentation

## Table: users

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `user_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `email` | `text` | No | None | Unique, Not Null |
| `full_name` | `text` | No | None | Not Null |
| `phone` | `text` | Yes | None | - |
| `profile_image_url` | `text` | Yes | None | - |
| `user_type` | `text` | No | None | Not Null |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `status` | `text` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByUserId(user_id)` - Returns a single record(s)
- `getByUserId(user_id)` - Returns a single record(s)
- `getByEmail(email)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final users = UsersModel(
  // Add required fields here
);

// Use the repository to save it
final repository = UsersRepository(client);
final savedId = await repository.create(users);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
