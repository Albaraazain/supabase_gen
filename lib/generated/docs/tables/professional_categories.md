# ProfessionalCategoriesModel Documentation

## Table: professional_categories

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `professional_id` | `uuid` | Yes | None | Unique |
| `category_id` | `uuid` | Yes | None | Unique |
| `price_adjustment` | `numeric` | Yes | None | - |
| `price_rate` | `numeric` | Yes | None | - |
| `is_active` | `boolean` | Yes | true | - |
| `is_available` | `boolean` | Yes | true | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByProfessionalId(professional_id)` - Returns a single record(s)
- `getByCategoryId(category_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final professional_categories = ProfessionalCategoriesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Professional_categoriesRepository(client);
final savedId = await repository.create(professional_categories);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
