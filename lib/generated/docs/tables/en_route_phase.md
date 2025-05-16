# EnRoutePhaseModel Documentation

## Table: en_route_phase

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `job_id` | `uuid` | No | None | Primary Key, Not Null |
| `route_started_at` | `timestamp with time zone` | No | None | Not Null |
| `arrived_at` | `timestamp with time zone` | Yes | None | - |
| `estimated_arrival` | `timestamp with time zone` | Yes | None | - |
| `distance_km` | `double precision` | Yes | None | - |
| `transport_mode` | `text` | Yes | None | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByJobId(job_id)` - Returns a single record(s)
- `getByJobId(job_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final en_route_phase = EnRoutePhaseModel(
  // Add required fields here
);

// Use the repository to save it
final repository = En_route_phaseRepository(client);
final savedId = await repository.create(en_route_phase);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
