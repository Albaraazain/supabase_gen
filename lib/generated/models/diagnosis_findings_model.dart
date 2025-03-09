
class DiagnosisFindingsModel {
  final String findingId;
  final String jobId;
  final String title;
  final String? description;
  final bool? isMandatory;
  final bool? requiresImmediateAction;
  final String? severity;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DiagnosisFindingsModel({
    required this.findingId,
    required this.jobId,
    required this.title,
    this.description,
    this.isMandatory,
    this.requiresImmediateAction,
    this.severity,
    this.createdAt,
    this.updatedAt,
  });

  // Helper method to safely convert numeric values
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {}
    }
    return null;
  }

  factory DiagnosisFindingsModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisFindingsModel(
      findingId: json['finding_id'] ?? '',
      jobId: json['job_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      isMandatory: json['is_mandatory'],
      requiresImmediateAction: json['requires_immediate_action'],
      severity: json['severity'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'finding_id': findingId,
      'job_id': jobId,
      'title': title,
      'description': description,
      'is_mandatory': isMandatory,
      'requires_immediate_action': requiresImmediateAction,
      'severity': severity,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  DiagnosisFindingsModel copyWith({
    String? findingId,
    String? jobId,
    String? title,
    String? description,
    bool? isMandatory,
    bool? requiresImmediateAction,
    String? severity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DiagnosisFindingsModel(
      findingId: findingId ?? this.findingId,
      jobId: jobId ?? this.jobId,
      title: title ?? this.title,
      description: description ?? this.description,
      isMandatory: isMandatory ?? this.isMandatory,
      requiresImmediateAction: requiresImmediateAction ?? this.requiresImmediateAction,
      severity: severity ?? this.severity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
