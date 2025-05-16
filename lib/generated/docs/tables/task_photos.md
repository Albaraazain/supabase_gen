# TaskPhotosModel Documentation

## Table: task_photos

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `task_photo_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `task_id` | `uuid` | No | None | Unique, Not Null |
| `photo_id` | `uuid` | No | None | Unique, Not Null |
| `is_primary` | `boolean` | Yes | false | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByTaskPhotoId(task_photo_id)` - Returns a single record(s)
- `getByTaskPhotoId(task_photo_id)` - Returns a single record(s)
- `getByTaskId(task_id)` - Returns a single record(s)
- `getByPhotoId(photo_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final task_photos = TaskPhotosModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Task_photosRepository(client);
final savedId = await repository.create(task_photos);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
