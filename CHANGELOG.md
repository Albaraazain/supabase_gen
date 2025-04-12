## 1.4.0

### Added
- Enhanced `findAll` method in generated repositories to support filtering
- Added optional `filters` parameter of type `Map<String, dynamic>` to `findAll` method
- Filtering can be combined with existing pagination and sorting parameters
- All repositories now inherit filtering capability from base repository

### Example
```dart
// Filter by single field
final results = await repository.findAll(
  filters: {'status': 'active'}
);

// Combine with pagination and sorting
final results = await repository.findAll(
  filters: {'category': 'residential'},
  limit: 10,
  offset: 0,
  orderBy: 'created_at',
  ascending: false
);
```
