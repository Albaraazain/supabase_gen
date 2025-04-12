## 1.6.0

### Added
- Enhanced `findAll` method in generated repositories to support filtering
- Added optional `filters` parameter of type `Map<String, dynamic>` to `findAll` method
- Filtering can be combined with existing pagination and sorting parameters
- All repositories now inherit filtering capability from base repository
- Added new foreign key methods for more flexible querying:
  - `findBy{ForeignKey}Field` methods for each foreign key with pagination, sorting, and additional filtering support
  - These complement existing `findBy{ForeignKey}` methods that find related parent records

### Example - Basic Filtering
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

### Example - Foreign Key Methods
```dart
// Find quotes for a specific bill with additional filters
final quotes = await quotesRepository.findByBillIdField(
  billId,
  limit: 10,
  orderBy: 'created_at',
  additionalFilters: {'status': 'pending'}
);

// Find the parent bill for a quote (existing functionality)
final bills = await quotesRepository.findByBillId(billId);
