import 'dart:convert';

class TestJobsModel {
  final String id;
  final String currentStage;

  const TestJobsModel({
    required this.id,
    required this.currentStage,
  });

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
