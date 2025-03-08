// cleanup_generated.dart
// This script cleans up the generated files, keeping only the public schema tables
// and removing system tables and views.

import 'dart:io';
import 'package:path/path.dart' as path;

void main() async {
  final generatedDir = Directory('lib/generated');
  final modelsDir = Directory(path.join(generatedDir.path, 'models'));
  final reposDir = Directory(path.join(generatedDir.path, 'repositories'));
  
  // Keep only these public schema tables
  final keepTables = [
    'diagnosis_findings',
    'error_logs',
    'homeowner_profiles',
    'job_broadcasts',
    'job_stage_history',
    'job_tasks',
    'jobs',
    'jobs_backup',
    'location_verifications',
    'material_usage',
    'professional_earnings',
    'professional_earnings_backup',
    'professional_profiles',
    'professional_profiles_backup',
    'professional_responses',
    'professional_responses_backup',
    'professional_services',
    'professional_services_backup',
    'quote_line_items',
    'safety_checks',
    'service_categories',
    'service_quotes',
    'services',
    'site_photos',
    'test_jobs',
    'users',
  ];
  
  // Always keep these files
  final alwaysKeep = [
    'models.dart',
    'base_repository.dart',
    'repositories.dart',
  ];
  
  print('Cleaning up generated files...');
  
  // Clean up models
  await _cleanupDirectory(modelsDir, keepTables, alwaysKeep);
  
  // Clean up repositories
  await _cleanupDirectory(reposDir, keepTables, alwaysKeep);
  
  // Update barrel files
  await _updateBarrelFile(
    path.join(modelsDir.path, 'models.dart'),
    keepTables.map((t) => '${t}_model.dart').toList(),
  );
  
  await _updateBarrelFile(
    path.join(reposDir.path, 'repositories.dart'),
    ['base_repository.dart', ...keepTables.map((t) => '${t}_repository.dart')],
  );
  
  print('Cleanup completed successfully!');
}

Future<void> _cleanupDirectory(Directory dir, List<String> keepTables, List<String> alwaysKeep) async {
  if (!dir.existsSync()) return;
  
  final files = dir.listSync();
  
  for (final file in files) {
    if (file is File) {
      final fileName = path.basename(file.path);
      
      // Always keep certain files
      if (alwaysKeep.contains(fileName)) {
        continue;
      }
      
      // Keep files for tables in the keepTables list
      bool shouldKeep = false;
      for (final table in keepTables) {
        if (fileName.startsWith('${table}_')) {
          shouldKeep = true;
          break;
        }
      }
      
      if (!shouldKeep) {
        print('Deleting ${file.path}');
        await file.delete();
      }
    }
  }
}

Future<void> _updateBarrelFile(String filePath, List<String> files) async {
  final file = File(filePath);
  if (!file.existsSync()) return;
  
  final sb = StringBuffer();
  sb.writeln('// Generated barrel file');
  sb.writeln();
  
  for (final f in files) {
    sb.writeln("export '$f';");
  }
  
  await file.writeAsString(sb.toString());
  print('Updated barrel file: $filePath');
} 