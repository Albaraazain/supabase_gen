# LocationVerificationsModel Documentation

## Table: location_verifications

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `verification_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `job_id` | `uuid` | No | None | Not Null |
| `user_id` | `uuid` | No | None | Not Null |
| `latitude` | `numeric` | No | None | Not Null |
| `longitude` | `numeric` | No | None | Not Null |
| `accuracy_meters` | `numeric` | Yes | None | - |
| `verified_at` | `timestamp with time zone` | Yes | now() | - |
| `verification_type` | `text` | No | None | Not Null |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `address_line1` | `text` | Yes | None | - |
| `address_line2` | `text` | Yes | None | - |
| `city` | `text` | Yes | None | - |
| `state` | `text` | Yes | None | - |
| `postal_code` | `text` | Yes | None | - |
| `country` | `text` | Yes | 'US'::text | - |
| `address_verified` | `boolean` | Yes | false | - |
| `verification_status` | `text` | No | 'pending'::text | Not Null |
| `failure_reason` | `text` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByVerificationId(verification_id)` - Returns a single record(s)
- `getByVerificationId(verification_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final location_verifications = LocationVerificationsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Location_verificationsRepository(client);
final savedId = await repository.create(location_verifications);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
