# TransactionsModel Documentation

## Table: transactions

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `booking_id` | `uuid` | Yes | None | Foreign Key → bookings(id) |
| `payer_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `payee_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `amount` | `numeric` | No | None | Not Null |
| `currency` | `text` | Yes | 'USD'::text | - |
| `transaction_type` | `text` | Yes | 'payment'::text | - |
| `payment_method` | `text` | Yes | None | - |
| `status` | `text` | Yes | 'pending'::text | - |
| `external_payment_id` | `text` | Yes | None | - |
| `fee_amount` | `numeric` | Yes | 0 | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `completed_at` | `timestamp with time zone` | Yes | None | - |
| `instant_ride_request_id` | `uuid` | Yes | None | Foreign Key → instant_ride_requests(id) |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **bookings** via `booking_id` → `id`
- **instant_ride_requests** via `instant_ride_request_id` → `id`
- **profiles** via `payee_id` → `id`
- **profiles** via `payer_id` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByBookingId(booking_id)` - Returns multiple record(s)
- `getByInstantRideRequestId(instant_ride_request_id)` - Returns multiple record(s)
- `getByPayeeId(payee_id)` - Returns multiple record(s)
- `getByPayerId(payer_id)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final transactions = TransactionsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = TransactionsRepository(client);
final savedId = await repository.create(transactions);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
