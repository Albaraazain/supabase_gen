
/// Generated model class for table test_jobs
class TestJobsModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String name;
  final String? description;
  final DateTime? createdAt;

  TestJobsModel({this.jobId = "", required this.name, this.description, this.createdAt})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(name != null, "name constraint violation"); return true; }());

  factory TestJobsModel.fromJson(Map<String, dynamic> json) {
    return TestJobsModel(
      jobId: json['job_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'name': name,
      'description': description,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TestJobsModel && other.jobId == jobId && other.name == name && other.description == description && other.createdAt == createdAt;
  }

  @override
  int get hashCode => jobId.hashCode ^ name.hashCode ^ description.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'TestJobsModel(jobId: $jobId, name: $name, description: $description, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
}


