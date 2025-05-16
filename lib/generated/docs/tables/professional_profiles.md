# ProfessionalProfilesModel Documentation

## Table: professional_profiles

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `professional_id` | `uuid` | No | None | Primary Key, Not Null |
| `bio` | `text` | Yes | None | - |
| `business_name` | `text` | Yes | None | - |
| `license_number` | `text` | Yes | None | - |
| `license_type` | `text` | Yes | None | - |
| `license_verified` | `boolean` | Yes | false | - |
| `verification_status` | `text` | Yes | 'pending'::text | - |
| `verified_at` | `timestamp with time zone` | Yes | None | - |
| `years_experience` | `integer` | Yes | None | - |
| `experience_years` | `integer` | Yes | None | - |
| `radius_miles` | `integer` | Yes | 20 | - |
| `service_radius` | `integer` | Yes | 20 | - |
| `availability` | `text` | Yes | None | - |
| `availability_status` | `text` | Yes | 'offline'::text | - |
| `base_location_lat` | `numeric` | Yes | None | - |
| `base_location_lng` | `numeric` | Yes | None | - |
| `current_location_lat` | `numeric` | Yes | None | - |
| `current_location_lng` | `numeric` | Yes | None | - |
| `rating` | `numeric` | Yes | None | - |
| `total_ratings` | `integer` | Yes | 0 | - |
| `total_jobs_completed` | `integer` | Yes | 0 | - |
| `acceptance_rate` | `numeric` | Yes | 0 | - |
| `active_status` | `text` | Yes | 'inactive'::text | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `is_online` | `boolean` | No | true | Not Null |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByProfessionalId(professional_id)` - Returns a single record(s)
- `getByProfessionalId(professional_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final professional_profiles = ProfessionalProfilesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Professional_profilesRepository(client);
final savedId = await repository.create(professional_profiles);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
