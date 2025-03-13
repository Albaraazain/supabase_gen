
class TestJobsModel {
  final DateTime? createdAt;
  final String? description;
  final String? jobId;
  final String name;

  TestJobsModel({
    this.createdAt,
    this.description,
    this.jobId,
    required this.name,
  });

  factory TestJobsModel.fromJson(Map<String, dynamic> json) {
    return TestJobsModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      description: json['description'],
      jobId: json['job_id'],
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (description != null) {
      json['description'] = description;
    }
    if (jobId != null) {
      json['job_id'] = jobId;
    }
    json['name'] = name;
    return json;
  }

  TestJobsModel copyWith({
    DateTime? createdAt,
    String? description,
    String? jobId,
    String? name,
  }) {
    return TestJobsModel(
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      jobId: jobId ?? this.jobId,
      name: name ?? this.name,
    );
  }
}
