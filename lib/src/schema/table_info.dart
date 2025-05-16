// lib/src/schema/table_info.dart

/// Information about a database column
class ColumnInfo {
  final String name;
  final String type;
  final bool isNullable;
  final bool isPrimaryKey;
  final bool isUnique;
  final String? defaultValue;
  final String? foreignKey;
  final String? foreignTable;
  final String? comment;
  final int? maxLength;
  final int? ordinalPosition;

  ColumnInfo({
    required this.name,
    required this.type,
    required this.isNullable,
    required this.isPrimaryKey,
    this.isUnique = false,
    this.defaultValue,
    this.foreignKey,
    this.foreignTable,
    this.comment,
    this.maxLength,
    this.ordinalPosition,
  });

  @override
  String toString() => 
    'Column $name ($type, nullable: $isNullable, PK: $isPrimaryKey)';
}

/// Information about a database constraint
class ConstraintInfo {
  final String name;
  final String type;
  final String? columnName;
  final String? referenceTable;
  final String? referenceColumn;

  ConstraintInfo({
    required this.name,
    required this.type,
    this.columnName,
    this.referenceTable,
    this.referenceColumn,
  });

  @override
  String toString() => 
    'Constraint $name ($type, column: $columnName)';
}

/// Information about a database index
class IndexInfo {
  final String name;
  final String columnName;
  final bool isUnique;
  final bool isPrimary;

  IndexInfo({
    required this.name,
    required this.columnName,
    required this.isUnique,
    required this.isPrimary,
  });

  @override
  String toString() => 
    'Index $name (column: $columnName, unique: $isUnique, primary: $isPrimary)';
}

/// Information about a database trigger
class TriggerInfo {
  final String name;
  final String eventType;
  final String actionTime;
  final String actionStatement;

  TriggerInfo({
    required this.name,
    required this.eventType,
    required this.actionTime,
    required this.actionStatement,
  });

  @override
  String toString() => 
    'Trigger $name ($eventType $actionTime)';
}

/// Information about a database table
class TableInfo {
  final String name;
  final String schema;
  final List<ColumnInfo> columns;
  final List<ConstraintInfo> constraints;
  final List<IndexInfo> indexes;
  final List<TriggerInfo> triggers;
  final String? comment;
  final bool isView;

  TableInfo({
    required this.name,
    required this.schema,
    required this.columns,
    this.constraints = const [],
    this.indexes = const [],
    this.triggers = const [],
    this.comment,
    this.isView = false,
  });

  List<ColumnInfo> get primaryKeys => 
    columns.where((col) => col.isPrimaryKey).toList();

  List<ColumnInfo> get foreignKeys =>
    columns.where((col) => col.foreignKey != null).toList();
    
  /// Whether this table has explicitly defined primary keys
  bool get hasPrimaryKey => primaryKeys.isNotEmpty;

  @override
  String toString() => isView 
    ? 'View $schema.$name with ${columns.length} columns' 
    : 'Table $schema.$name with ${columns.length} columns';
}