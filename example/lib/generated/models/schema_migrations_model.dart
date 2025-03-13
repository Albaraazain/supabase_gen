
class SchemaMigrationsModel {
  final String? name;
  final String? statements;
  final String version;

  SchemaMigrationsModel({
    this.name,
    this.statements,
    required this.version,
  });

  factory SchemaMigrationsModel.fromJson(Map<String, dynamic> json) {
    return SchemaMigrationsModel(
      name: json['name'],
      statements: json['statements'],
      version: json['version'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) {
      json['name'] = name;
    }
    if (statements != null) {
      json['statements'] = statements;
    }
    json['version'] = version;
    return json;
  }

  SchemaMigrationsModel copyWith({
    String? name,
    String? statements,
    String? version,
  }) {
    return SchemaMigrationsModel(
      name: name ?? this.name,
      statements: statements ?? this.statements,
      version: version ?? this.version,
    );
  }
}
