# TripSearchesModel Documentation

## Table: trip_searches

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `searcher_id` | `uuid` | Yes | None | Foreign Key → profiles(id) |
| `origin_address` | `text` | Yes | None | - |
| `origin_lat` | `numeric` | Yes | None | - |
| `origin_lng` | `numeric` | Yes | None | - |
| `origin_point` | `USER-DEFINED` | Yes | None | - |
| `destination_address` | `text` | Yes | None | - |
| `destination_lat` | `numeric` | Yes | None | - |
| `destination_lng` | `numeric` | Yes | None | - |
| `destination_point` | `USER-DEFINED` | Yes | None | - |
| `search_date` | `date` | No | None | Not Null |
| `search_time` | `time without time zone` | No | None | Not Null |
| `max_price_willing` | `numeric` | Yes | None | - |
| `max_detour_km` | `integer` | Yes | None | - |
| `results_count` | `integer` | Yes | 0 | - |
| `selected_trip_id` | `uuid` | Yes | None | Foreign Key → trips(id) |
| `made_request` | `boolean` | Yes | false | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `searcher_id` → `id`
- **trips** via `selected_trip_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getBySearcherId(searcher_id)` - Returns multiple record(s)
- `getBySelectedTripId(selected_trip_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final trip_searches = TripSearchesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Trip_searchesRepository(client);
final savedId = await repository.create(trip_searches);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
