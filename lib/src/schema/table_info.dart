// lib/src/schema/table_info.dart
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
  });

  @override
  String toString() => 
    'Column $name ($type, nullable: $isNullable, PK: $isPrimaryKey)';
}

class TableInfo {
  final String name;
  final String schema;
  final List<ColumnInfo> columns;
  final String? comment;

  TableInfo({
    required this.name,
    required this.schema,
    required this.columns,
    this.comment,
  });

  List<ColumnInfo> get primaryKeys => 
    columns.where((col) => col.isPrimaryKey).toList();

  @override
  String toString() => 'Table $schema.$name with ${columns.length} columns';
}