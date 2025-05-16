# SitePhotosModel Documentation

## Table: site_photos

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `photo_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `job_id` | `uuid` | No | None | Not Null |
| `photo_url` | `text` | No | None | Not Null |
| `description` | `text` | Yes | None | - |
| `photo_type` | `text` | Yes | None | - |
| `taken_at` | `timestamp with time zone` | Yes | now() | - |
| `uploaded_by` | `uuid` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByPhotoId(photo_id)` - Returns a single record(s)
- `getByPhotoId(photo_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final site_photos = SitePhotosModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Site_photosRepository(client);
final savedId = await repository.create(site_photos);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
