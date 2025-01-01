import 'dart:convert';

class GetEmployeeModel {
  final int workflowScore;
  final int performanceScore;
  final String id;
  final String name;
  final String position;
  final String profileImage;

  GetEmployeeModel({
    required this.workflowScore,
    required this.performanceScore,
    required this.id,
    required this.name,
    required this.position,
    required this.profileImage,
  });

  // Factory method to create an Employee object from a JSON map
  factory GetEmployeeModel.fromJson(Map<String, dynamic> json) {
    return GetEmployeeModel(
      workflowScore: json['workflowScore'] ?? 0,
      performanceScore: json['performanceScore'] ?? 0,
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }
}

// Model for the entire API response
class EmployeeResponse {
  final bool success;
  final List<GetEmployeeModel> data;

  EmployeeResponse({
    required this.success,
    required this.data,
  });

  // Factory method to create EmployeeResponse from JSON
  factory EmployeeResponse.fromJson(String jsonStr) {
    final Map<String, dynamic> json = jsonDecode(jsonStr);
    return EmployeeResponse(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>)
          .map((e) => GetEmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
