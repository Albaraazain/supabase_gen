// lib/src/schema/constraint_metadata.dart
import 'table_info.dart';
import '../utils/string_utils.dart';

/// Metadata representation of all constraints for a table
class TableConstraintMetadata {
  final String tableName;
  final List<ColumnConstraintMetadata> columns;
  final List<ForeignKeyConstraint> foreignKeys;
  final List<UniqueConstraint> uniqueConstraints;
  final List<CheckConstraint> checkConstraints;
  final PrimaryKeyConstraint? primaryKey;
  
  TableConstraintMetadata({
    required this.tableName,
    required this.columns,
    required this.foreignKeys,
    required this.uniqueConstraints,
    required this.checkConstraints,
    this.primaryKey,
  });
  
  /// Factory to create metadata from TableInfo
  factory TableConstraintMetadata.fromTableInfo(TableInfo table) {
    // Extract primary key
    final primaryKeyColumns = table.columns.where((col) => col.isPrimaryKey).toList();
    PrimaryKeyConstraint? primaryKey;
    
    if (primaryKeyColumns.isNotEmpty) {
      primaryKey = PrimaryKeyConstraint(
        name: 'pk_${table.name}',
        columns: primaryKeyColumns.map((col) => col.name).toList(),
      );
    }
    
    // Process all constraints
    final foreignKeys = <ForeignKeyConstraint>[];
    final uniqueConstraints = <UniqueConstraint>[];
    final checkConstraints = <CheckConstraint>[];
    
    for (final constraint in table.constraints) {
      final type = constraint.type.toUpperCase();
      
      if (type == 'FOREIGN KEY' && constraint.columnName != null && 
          constraint.referenceTable != null && constraint.referenceColumn != null) {
        foreignKeys.add(ForeignKeyConstraint(
          name: constraint.name,
          columnName: constraint.columnName!,
          referenceTable: constraint.referenceTable!,
          referenceColumn: constraint.referenceColumn!,
        ));
      } else if (type == 'UNIQUE' && constraint.columnName != null) {
        uniqueConstraints.add(UniqueConstraint(
          name: constraint.name,
          columnNames: [constraint.columnName!],
        ));
      } else if (type == 'CHECK') {
        checkConstraints.add(CheckConstraint(
          name: constraint.name,
          condition: 'Database CHECK constraint',
        ));
      }
    }
    
    // Process column-level constraints
    final columns = table.columns.map((col) {
      // Determine the proper Dart type from the column type
      final dartType = _getDartTypeFromColumnType(col.type);
      
      return ColumnConstraintMetadata(
        columnName: col.name,
        isNullable: col.isNullable,
        isUnique: col.isUnique,
        isPrimaryKey: col.isPrimaryKey,
        defaultValue: col.defaultValue,
        dartType: dartType,
        maxLength: col.maxLength,
      );
    }).toList();
    
    return TableConstraintMetadata(
      tableName: table.name,
      columns: columns,
      foreignKeys: foreignKeys,
      uniqueConstraints: uniqueConstraints,
      checkConstraints: checkConstraints,
      primaryKey: primaryKey,
    );
  }
  
  /// Helper method to convert PostgreSQL types to Dart types
  static String _getDartTypeFromColumnType(String pgType) {
    final type = pgType.toLowerCase();
    
    if (type.contains('int') || type.startsWith('serial')) {
      return 'int';
    } else if (type == 'numeric' || type == 'decimal' || type == 'float' || type == 'double precision') {
      return 'double';
    } else if (type == 'boolean') {
      return 'bool';
    } else if (type.contains('timestamp') || type.contains('date')) {
      return 'DateTime';
    } else if (type == 'jsonb' || type == 'json') {
      return 'Map<String, dynamic>';
    } else if (type.startsWith('_') || type.contains('[]')) {
      return 'List<dynamic>';
    } else {
      return 'String';
    }
  }
  
  /// Get all column names involved in any unique constraint
  List<String> get allUniqueColumns {
    final result = <String>[];
    
    // Add individual unique columns
    result.addAll(columns
        .where((col) => col.isUnique)
        .map((col) => col.columnName));
    
    // Add columns from multi-column unique constraints
    for (final constraint in uniqueConstraints) {
      result.addAll(constraint.columnNames);
    }
    
    return result.toSet().toList(); // Remove duplicates
  }
  
  /// Get all lookup methods that can be generated based on constraints
  List<LookupMethod> getLookupMethods() {
    final methods = <LookupMethod>[];
    
    // Primary key lookup method
    if (primaryKey != null) {
      methods.add(LookupMethod(
        methodName: 'getBy${primaryKey!.columns.map((c) => StringUtils.toPascalCase(c)).join('And')}',
        parameterNames: primaryKey!.columns,
        isUnique: true,
      ));
    }
    
    // Unique constraint lookup methods
    for (final col in columns.where((c) => c.isUnique)) {
      methods.add(LookupMethod(
        methodName: 'getBy${StringUtils.toPascalCase(col.columnName)}',
        parameterNames: [col.columnName],
        isUnique: true,
      ));
    }
    
    // Foreign key lookup methods
    for (final fk in foreignKeys) {
      methods.add(LookupMethod(
        methodName: 'getBy${StringUtils.toPascalCase(fk.columnName)}',
        parameterNames: [fk.columnName],
        isUnique: false,
      ));
    }
    
    return methods;
  }
}

/// Metadata for a column's constraints
class ColumnConstraintMetadata {
  final String columnName;
  final bool isNullable;
  final bool isUnique;
  final bool isPrimaryKey;
  final String? defaultValue;
  final String dartType;
  final int? maxLength;
  
  ColumnConstraintMetadata({
    required this.columnName,
    required this.isNullable,
    required this.isUnique,
    required this.isPrimaryKey,
    required this.dartType,
    this.defaultValue,
    this.maxLength,
  });
  
  /// Generate Dart validation code for this column's constraints
  String generateValidationCode() {
    final varName = StringUtils.toVariableName(columnName);
    final validations = <String>[];
    
    if (!isNullable) {
      validations.add('$varName != null');
    }
    
    if (maxLength != null && (dartType == 'String' || dartType == 'String?')) {
      validations.add('($varName == null || $varName.length <= $maxLength)');
    }
    
    if (validations.isEmpty) {
      return '';
    }
    
    return 'assert(${validations.join(' && ')}, "$columnName constraint violation")';
  }
}

/// Primary key constraint metadata
class PrimaryKeyConstraint {
  final String name;
  final List<String> columns;
  
  PrimaryKeyConstraint({
    required this.name,
    required this.columns,
  });
  
  bool get isComposite => columns.length > 1;
}

/// Foreign key constraint metadata
class ForeignKeyConstraint {
  final String name;
  final String columnName;
  final String referenceTable;
  final String referenceColumn;
  
  ForeignKeyConstraint({
    required this.name,
    required this.columnName,
    required this.referenceTable,
    required this.referenceColumn,
  });
  
  /// Format the relation name for code generation
  String get relationName {
    // Extract entity name from table (remove "s" if plural)
    String entity = referenceTable;
    if (entity.endsWith('s')) {
      entity = entity.substring(0, entity.length - 1);
    }
    return StringUtils.toCamelCase(entity);
  }
}

/// Unique constraint metadata
class UniqueConstraint {
  final String name;
  final List<String> columnNames;
  
  UniqueConstraint({
    required this.name,
    required this.columnNames,
  });
  
  bool get isComposite => columnNames.length > 1;
  
  /// Get method name for fetching by this unique constraint
  String get methodName {
    return 'getBy${columnNames.map((c) => StringUtils.toPascalCase(c)).join('And')}';
  }
}

/// Check constraint metadata
class CheckConstraint {
  final String name;
  final String condition;
  
  CheckConstraint({
    required this.name,
    required this.condition,
  });
}

/// Lookup method definition based on constraints
class LookupMethod {
  final String methodName;
  final List<String> parameterNames;
  final bool isUnique;
  
  LookupMethod({
    required this.methodName,
    required this.parameterNames,
    required this.isUnique,
  });
  
  /// Get return type based on uniqueness
  String getReturnType(String modelName) {
    return isUnique ? modelName : 'List<$modelName>';
  }
}