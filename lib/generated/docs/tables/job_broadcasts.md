# JobBroadcastsModel Documentation

## Table: job_broadcasts

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `broadcast_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `homeowner_id` | `uuid` | Yes | None | - |
| `title` | `text` | No | None | Not Null |
| `description` | `text` | Yes | None | - |
| `address` | `text` | Yes | None | - |
| `city` | `text` | Yes | None | - |
| `state` | `text` | Yes | None | - |
| `zip_code` | `text` | Yes | None | - |
| `latitude` | `numeric` | Yes | None | - |
| `longitude` | `numeric` | Yes | None | - |
| `location_address` | `text` | Yes | None | - |
| `scheduled_time` | `timestamp with time zone` | Yes | None | - |
| `price_range_min` | `numeric` | Yes | None | - |
| `price_range_max` | `numeric` | Yes | None | - |
| `status` | `text` | Yes | 'active'::text | - |
| `urgency_level` | `text` | Yes | 'normal'::text | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `expires_at` | `timestamp with time zone` | Yes | None | - |
| `category_id` | `uuid` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByBroadcastId(broadcast_id)` - Returns a single record(s)
- `getByBroadcastId(broadcast_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final job_broadcasts = JobBroadcastsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Job_broadcastsRepository(client);
final savedId = await repository.create(job_broadcasts);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
