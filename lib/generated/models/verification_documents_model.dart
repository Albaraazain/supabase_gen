
/// Generated model class for table verification_documents
/// Database triggers associated with this table:
/// - update_verification_documents_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
///   Signature: update_updated_at_column() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
///
class VerificationDocumentsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References profiles(id)
  final String userId;
  /// Non-nullable field
  final String documentType;
  /// Non-nullable field
  final String documentUrl;
  final String? documentNumber;
  final String? verificationStatus;
  /// References profiles(id)
  final String? verifiedBy;
  final DateTime? verifiedAt;
  final String? rejectionReason;
  final DateTime? expiresAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VerificationDocumentsModel({this.id = "", required this.userId, required this.documentType, required this.documentUrl, this.documentNumber, this.verificationStatus, this.verifiedBy, this.verifiedAt, this.rejectionReason, this.expiresAt, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(userId != null, "user_id constraint violation"); assert(documentType != null, "document_type constraint violation"); assert(documentUrl != null, "document_url constraint violation"); return true; }());

  factory VerificationDocumentsModel.fromJson(Map<String, dynamic> json) {
    return VerificationDocumentsModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      documentType: json['document_type'] ?? '',
      documentUrl: json['document_url'] ?? '',
      documentNumber: json['document_number'],
      verificationStatus: json['verification_status'],
      verifiedBy: json['verified_by'],
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
      rejectionReason: json['rejection_reason'],
      expiresAt: json['expires_at'] != null ? _parseDate(json['expires_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'document_type': documentType,
      'document_url': documentUrl,
      'document_number': documentNumber,
      'verification_status': verificationStatus,
      'verified_by': verifiedBy,
      'verified_at': verifiedAt?.toIso8601String(),
      'rejection_reason': rejectionReason,
      'expires_at': expiresAt != null ? "${expiresAt!.year.toString().padLeft(4, '0')}-${expiresAt!.month.toString().padLeft(2, '0')}-${expiresAt!.day.toString().padLeft(2, '0')}" : null,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'user_id': userId,
      'document_type': documentType,
      'document_url': documentUrl,
      'document_number': documentNumber,
      'verification_status': verificationStatus,
      'verified_by': verifiedBy,
      'verified_at': verifiedAt?.toIso8601String(),
      'rejection_reason': rejectionReason,
      'expires_at': expiresAt != null ? "${expiresAt!.year.toString().padLeft(4, '0')}-${expiresAt!.month.toString().padLeft(2, '0')}-${expiresAt!.day.toString().padLeft(2, '0')}" : null,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'user_id': userId,
      'document_type': documentType,
      'document_url': documentUrl,
      'document_number': documentNumber,
      'verification_status': verificationStatus,
      'verified_by': verifiedBy,
      'verified_at': verifiedAt?.toIso8601String(),
      'rejection_reason': rejectionReason,
      'expires_at': expiresAt != null ? "${expiresAt!.year.toString().padLeft(4, '0')}-${expiresAt!.month.toString().padLeft(2, '0')}-${expiresAt!.day.toString().padLeft(2, '0')}" : null,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VerificationDocumentsModel && other.id == id && other.userId == userId && other.documentType == documentType && other.documentUrl == documentUrl && other.documentNumber == documentNumber && other.verificationStatus == verificationStatus && other.verifiedBy == verifiedBy && other.verifiedAt == verifiedAt && other.rejectionReason == rejectionReason && other.expiresAt == expiresAt && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ documentType.hashCode ^ documentUrl.hashCode ^ documentNumber.hashCode ^ verificationStatus.hashCode ^ verifiedBy.hashCode ^ verifiedAt.hashCode ^ rejectionReason.hashCode ^ expiresAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'VerificationDocumentsModel(id: $id, userId: $userId, documentType: $documentType, documentUrl: $documentUrl, documentNumber: $documentNumber, verificationStatus: $verificationStatus, verifiedBy: $verifiedBy, verifiedAt: $verifiedAt, rejectionReason: $rejectionReason, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  // Primary identifier is already defined as a field
}

  /// Helper function to parse DATE format (YYYY-MM-DD)
  DateTime _parseDate(String dateStr) {
    final parts = dateStr.split('-');
    return DateTime(
      int.parse(parts[0]), // year
      int.parse(parts[1]), // month
      int.parse(parts[2])  // day
    );
  }
