# QuoteLineItemsModel Documentation

## Table: quote_line_items

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `line_item_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `quote_id` | `uuid` | No | None | Not Null |
| `description` | `text` | No | None | Not Null |
| `quantity` | `numeric` | Yes | 1 | - |
| `unit_price` | `numeric` | No | None | Not Null |
| `amount` | `numeric` | No | None | Not Null |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |
| `item_type` | `text` | No | 'service'::text | Not Null |
| `category` | `text` | Yes | None | - |
| `notes` | `text` | Yes | None | - |
| `unit_type` | `text` | Yes | None | - |
| `reference_id` | `uuid` | Yes | None | - |
| `display_order` | `integer` | Yes | 0 | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByLineItemId(line_item_id)` - Returns a single record(s)
- `getByLineItemId(line_item_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final quote_line_items = QuoteLineItemsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Quote_line_itemsRepository(client);
final savedId = await repository.create(quote_line_items);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
