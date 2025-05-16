# LocationMapSettingsModel Documentation

## Table: location_map_settings

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `setting_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `job_id` | `uuid` | No | None | Unique, Not Null |
| `zoom_level` | `numeric` | Yes | None | - |
| `center_latitude` | `numeric` | Yes | None | - |
| `center_longitude` | `numeric` | Yes | None | - |
| `show_terrain` | `boolean` | Yes | false | - |
| `show_traffic` | `boolean` | Yes | false | - |
| `created_by` | `uuid` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getBySettingId(setting_id)` - Returns a single record(s)
- `getBySettingId(setting_id)` - Returns a single record(s)
- `getByJobId(job_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final location_map_settings = LocationMapSettingsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Location_map_settingsRepository(client);
final savedId = await repository.create(location_map_settings);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
