# VerificationDocumentsModel Documentation

## Table: verification_documents

No description available for this table.

## Schema

| Field | Type | Nullable | Default | Constraints |
|-------|------|----------|---------|-------------|
| `id` | `uuid` | No | gen_random_uuid() | Primary Key, Not Null |
| `user_id` | `uuid` | No | None | Not Null, Foreign Key → profiles(id) |
| `document_type` | `text` | No | None | Not Null |
| `document_url` | `text` | No | None | Not Null |
| `document_number` | `text` | Yes | None | - |
| `verification_status` | `text` | Yes | 'pending'::text | - |
| `verified_by` | `uuid` | Yes | None | Foreign Key → profiles(id) |
| `verified_at` | `timestamp with time zone` | Yes | None | - |
| `rejection_reason` | `text` | Yes | None | - |
| `expires_at` | `date` | Yes | None | - |
| `created_at` | `timestamp with time zone` | Yes | now() | - |
| `updated_at` | `timestamp with time zone` | Yes | now() | - |

### One-to-Many Relationships

This table can have multiple related records in these tables:

*Relationship information is determined at runtime*

### Many-to-One Relationships

This table has references to these parent tables:

- **profiles** via `user_id` → `id`
- **profiles** via `verified_by` → `id`

### Available Lookup Methods

The following lookup methods are available in the repository:

- `getById(id)` - Returns a single record(s)
- `getById(id)` - Returns a single record(s)
- `getByUserId(user_id)` - Returns multiple record(s)
- `getByVerifiedBy(verified_by)` - Returns multiple record(s)


## Usage Example

```dart
// Create a new instance
final verification_documents = VerificationDocumentsModel(
  // Add required fields here
);

// Use the repository to save it
final repository = Verification_documentsRepository(client);
final savedId = await repository.create(verification_documents);

// Fetch by ID
final fetched = await repository.getById(savedId);
```
