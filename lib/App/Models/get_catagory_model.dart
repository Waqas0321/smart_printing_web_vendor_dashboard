class GetCategoryModel {
  final String id;
  final String name;

  GetCategoryModel({required this.id, required this.name});
  factory GetCategoryModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}
