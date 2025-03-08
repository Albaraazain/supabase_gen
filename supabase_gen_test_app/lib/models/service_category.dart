import 'package:supabase_gen/supabase_gen.dart';

@SupabaseTable('service_categories')
class ServiceCategory {
  final String id;
  final String name;
  final String? description;
  final DateTime createdAt;

  ServiceCategory({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt.toIso8601String(),
    };
  }
} 