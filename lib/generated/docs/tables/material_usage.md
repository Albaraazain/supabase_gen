# MaterialUsageModel Documentation

## Table: material_usage

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `usage_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `job_id` | `uuid` | No | None | Not Null |
| `material_name` | `text` | No | None | Not Null |
| `quantity` | `numeric` | No | None | Not Null |
| `unit` | `text` | Yes | None | - |
| `unit_cost` | `numeric` | Yes | None | - |
| `total_cost` | `numeric` | Yes | None | - |
| `used_at` | `timestamp with time zone` | Yes | now() | - |
| `recorded_by` | `uuid` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByUsageId(usage_id)` - Returns a single record(s)
- `getByUsageId(usage_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final material_usage = MaterialUsageModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Material_usageRepository(client);
final savedId = await repository.create(material_usage);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
