class EmployeeModel {
  final String name;
  final String email;
  final String position;
  final String phone;
  final String profileImage;
  final List<String> otherFiles;
  final String userID;
  final String password;
  final Permissions permissions;

  EmployeeModel({
    required this.name,
    required this.email,
    required this.position,
    required this.phone,
    required this.profileImage,
    required this.otherFiles,
    required this.userID,
    required this.password,
    required this.permissions,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      name: json['name'],
      email: json['email'],
      position: json['position'],
      phone: json['phone'],
      profileImage: json['profileImage'],
      otherFiles: List<String>.from(json['otherFiles']),
      userID: json['userID'],
      password: json['password'],
      permissions: Permissions.fromJson(json['permissions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'position': position,
      'phone': phone,
      'profileImage': profileImage,
      'otherFiles': otherFiles,
      'userID': userID,
      'password': password,
      'permissions': permissions.toJson(),
    };
  }
}

class Permissions {
  final bool createEmployee;
  final bool viewReports;

  Permissions({
    required this.createEmployee,
    required this.viewReports,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
      createEmployee: json['createEmployee'],
      viewReports: json['viewReports'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createEmployee': createEmployee,
      'viewReports': viewReports,
    };
  }
}
