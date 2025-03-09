
class TestJobsModel {
  final String id;
  final String currentStage;

  TestJobsModel({
    required this.id,
    required this.currentStage,
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

  factory TestJobsModel.fromJson(Map<String, dynamic> json) {
    return TestJobsModel(
      id: json['id'] ?? '',
      currentStage: json['current_stage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'current_stage': currentStage,
    };
  }

  TestJobsModel copyWith({
    String? id,
    String? currentStage,
  }) {
    return TestJobsModel(
      id: id ?? this.id,
      currentStage: currentStage ?? this.currentStage,
    );
  }
}
