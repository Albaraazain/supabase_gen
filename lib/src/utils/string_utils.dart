// lib/src/utils/string_utils.dart
import 'package:recase/recase.dart';

class StringUtils {
  /// Convert a database name to a Dart class name (PascalCase)
  static String toClassName(String name, {String? prefix, String? suffix}) {
    final className = ReCase(name).pascalCase;
    return '${prefix ?? ''}$className${suffix ?? ''}';
  }

  // toPascalCase method
  static String toPascalCase(String name) {
    return ReCase(name).pascalCase;
  }

  /// Convert a database name to a Dart variable name (camelCase)
  static String toVariableName(String name) {
    return ReCase(name).camelCase;
  }

  // toCamelCase method
  static String toCamelCase(String name) {
    return ReCase(name).camelCase;
  }

  /// Convert a database name to a Dart file name (snake_case)
  static String toFileName(String name) {
    return ReCase(name).snakeCase;
  }

  /// Convert a singular name to its plural form
  static String pluralize(String singular) {
    if (singular.isEmpty) return singular;

    // If the name already ends with 's', don't add another 's'
    if (singular.endsWith('s')) {
      return singular;
    }

    // Handle special cases and irregular plurals
    final specialCases = {
      'person': 'people',
      'child': 'children',
      'man': 'men',
      'woman': 'women',
      'tooth': 'teeth',
      'foot': 'feet',
      'mouse': 'mice',
      'goose': 'geese',
    };

    if (specialCases.containsKey(singular.toLowerCase())) {
      return specialCases[singular.toLowerCase()]!;
    }

    // Handle common plural rules
    if (singular.endsWith('y') &&
        !singular.endsWith('ay') &&
        !singular.endsWith('ey') &&
        !singular.endsWith('iy') &&
        !singular.endsWith('oy') &&
        !singular.endsWith('uy')) {
      return '${singular.substring(0, singular.length - 1)}ies';
    } else if (singular.endsWith('s') ||
        singular.endsWith('sh') ||
        singular.endsWith('ch') ||
        singular.endsWith('x') ||
        singular.endsWith('z')) {
      return '${singular}es';
    } else if (singular.endsWith('f')) {
      return '${singular.substring(0, singular.length - 1)}ves';
    } else if (singular.endsWith('fe')) {
      return '${singular.substring(0, singular.length - 2)}ves';
    }

    // Default case: add 's'
    return '${singular}s';
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
