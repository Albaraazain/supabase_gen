# MessagesModel Documentation

## Table: messages

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `message_id` | `uuid` | No | uuid_generate_v4() | Primary Key, Not Null |
| `conversation_id` | `uuid` | No | None | Not Null |
| `sender_id` | `uuid` | No | None | Not Null |
| `receiver_id` | `uuid` | No | None | Not Null |
| `job_id` | `uuid` | Yes | None | - |
| `content` | `text` | No | None | Not Null |
| `is_read` | `boolean` | Yes | false | - |
| `read_at` | `timestamp with time zone` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*


### Available Lookup Methods

The following lookup methods are available in the repository:

- `getByMessageId(message_id)` - Returns a single record(s)
- `getByMessageId(message_id)` - Returns a single record(s)


## Usage Example

```dart
// Create a new instance
final messages = MessagesModel(
  // Add required fields here
);

// Use the repository to save it
final repository = MessagesRepository(client);
final savedId = await repository.create(messages);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
