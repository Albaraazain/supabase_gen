# FindingPhotosModel Documentation

## Table: finding_photos

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `finding_photo_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `finding_id` | `uuid` | No | None | Unique, Not Null |
| `photo_id` | `uuid` | No | None | Unique, Not Null |
| `is_primary` | `boolean` | Yes | false | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByFindingPhotoId(finding_photo_id)` - Returns a single record(s)
- `getByFindingPhotoId(finding_photo_id)` - Returns a single record(s)
- `getByFindingId(finding_id)` - Returns a single record(s)
- `getByPhotoId(photo_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final finding_photos = FindingPhotosModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Finding_photosRepository(client);
final savedId = await repository.create(finding_photos);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
