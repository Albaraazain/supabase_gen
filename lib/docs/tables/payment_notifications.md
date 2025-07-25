# PaymentNotificationsModel Documentation

## Table: payment_notifications

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `created_at` | `timestamp with time zone` | No | now() | Not Null |
| `payment_id` | `uuid` | No | None | Not Null |
| `notification_id` | `uuid` | No | None | Not Null |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final payment_notifications = PaymentNotificationsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Payment_notificationsRepository(client);
final savedId = await repository.create(payment_notifications);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
