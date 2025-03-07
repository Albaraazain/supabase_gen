// lib/src/utils/string_utils.dart
import 'package:recase/recase.dart';

class StringUtils {
  /// Convert a database name to a Dart class name (PascalCase)
  static String toClassName(String name, {String? prefix, String? suffix}) {
    final className = ReCase(name).pascalCase;
    return '${prefix ?? ''}$className${suffix ?? ''}';
  }

  /// Convert a database name to a Dart variable name (camelCase)
  static String toVariableName(String name) {
    return ReCase(name).camelCase;
  }

  /// Convert a database name to a Dart file name (snake_case)
  static String toFileName(String name) {
    return ReCase(name).snakeCase;
  }

  /// Create a Dart import statement
  static String createImport(String path) {
    return "import '$path';";
  }

  /// Create a document comment
  static String? createDocComment(String? comment) {
    if (comment == null || comment.isEmpty) return null;
    
    final lines = comment.split('\n');
    if (lines.length == 1) {
      return '/// $comment';
    } else {
      return '''
/// ${lines.join('\n/// ')}
''';
    }
  }
}