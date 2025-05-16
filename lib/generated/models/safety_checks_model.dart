
/// Generated model class for table safety_checks
class SafetyChecksModel {
  /// Primary key field
  /// Non-nullable field
  final String checkId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String checkName;
  /// Non-nullable field
  final String status;
  final String? notes;
  final String? performedBy;
  final DateTime? performedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SafetyChecksModel({this.checkId = "", required this.jobId, required this.checkName, required this.status, this.notes, this.performedBy, this.performedAt, this.createdAt, this.updatedAt})
      : assert(() { assert(checkId != null, "check_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(checkName != null, "check_name constraint violation"); assert(status != null, "status constraint violation"); return true; }());

  factory SafetyChecksModel.fromJson(Map<String, dynamic> json) {
    return SafetyChecksModel(
      checkId: json['check_id'] ?? '',
      jobId: json['job_id'] ?? '',
      checkName: json['check_name'] ?? '',
      status: json['status'] ?? '',
      notes: json['notes'],
      performedBy: json['performed_by'],
      performedAt: json['performed_at'] != null ? DateTime.parse(json['performed_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'check_id': checkId,
      'job_id': jobId,
      'check_name': checkName,
      'status': status,
      'notes': notes,
      'performed_by': performedBy,
      'performed_at': performedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SafetyChecksModel && other.checkId == checkId && other.jobId == jobId && other.checkName == checkName && other.status == status && other.notes == notes && other.performedBy == performedBy && other.performedAt == performedAt && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => checkId.hashCode ^ jobId.hashCode ^ checkName.hashCode ^ status.hashCode ^ notes.hashCode ^ performedBy.hashCode ^ performedAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'SafetyChecksModel(checkId: $checkId, jobId: $jobId, checkName: $checkName, status: $status, notes: $notes, performedBy: $performedBy, performedAt: $performedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => checkId;
}


