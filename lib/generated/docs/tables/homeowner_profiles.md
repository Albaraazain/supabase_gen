# HomeownerProfilesModel Documentation

## Table: homeowner_profiles

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `homeowner_id` | `uuid` | No | None | Primary Key, Not Null |
| `address` | `text` | Yes | None | - |
| `city` | `text` | Yes | None | - |
| `state` | `text` | Yes | None | - |
| `zip_code` | `text` | Yes | None | - |
| `country` | `text` | Yes | 'USA'::text | - |
| `latitude` | `numeric` | Yes | None | - |
| `longitude` | `numeric` | Yes | None | - |
| `preferred_language` | `text` | Yes | 'en'::text | - |
| `notification_preferences` | `jsonb` | Yes | '{}'::jsonb | - |
| `verification_status` | `text` | Yes | 'pending'::text | - |
| `verified_at` | `timestamp with time zone` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByHomeownerId(homeowner_id)` - Returns a single record(s)
- `getByHomeownerId(homeowner_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final homeowner_profiles = HomeownerProfilesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Homeowner_profilesRepository(client);
final savedId = await repository.create(homeowner_profiles);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
