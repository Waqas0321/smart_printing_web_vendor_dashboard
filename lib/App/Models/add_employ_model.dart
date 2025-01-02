class AddEmployeeModel {
  final String name;
  final String email;
  final String position;
  final String phone;
  final String profileImage;
  final List<String> otherFiles;
  final String userID;
  final String password;
  final Permissions permissions;

  AddEmployeeModel({
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

  factory AddEmployeeModel.fromJson(Map<String, dynamic> json) {
    return AddEmployeeModel(
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
  bool provideEstimation;
  bool createEmployee;
  bool editWorkFlow;
  bool createOrder;
  bool addProcesses;
  bool machineOperatorDashboard;

  Permissions({
    this.provideEstimation = false,
    this.createEmployee = false,
    this.editWorkFlow = false,
    this.createOrder = false,
    this.addProcesses = false,
    this.machineOperatorDashboard = false,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
      provideEstimation: json['provideEstimation'] ?? false,
      createEmployee: json['createEmployee'] ?? false,
      editWorkFlow: json['editWorkFlow'] ?? false,
      createOrder: json['createOrder'] ?? false,
      addProcesses: json['addProcesses'] ?? false,
      machineOperatorDashboard: json['machineOperatorDashboard'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provideEstimation': provideEstimation,
      'createEmployee': createEmployee,
      'editWorkFlow': editWorkFlow,
      'createOrder': createOrder,
      'addProcesses': addProcesses,
      'machineOperatorDashboard': machineOperatorDashboard,
    };
  }

  // Update a permission value dynamically
  void updatePermission(String permissionKey, bool value) {
    switch (permissionKey) {
      case 'provideEstimation':
        provideEstimation = value;
        break;
      case 'createEmployee':
        createEmployee = value;
        break;
      case 'editWorkFlow':
        editWorkFlow = value;
        break;
      case 'createOrder':
        createOrder = value;
        break;
      case 'addProcesses':
        addProcesses = value;
        break;
      case 'machineOperatorDashboard':
        machineOperatorDashboard = value;
        break;
      default:
        print("Invalid permission key: $permissionKey");
        return;
    }
    print('$permissionKey updated to $value');
  }

  // Retrieve all selected permissions as a list
  List<String> getSelectedPermissions() {
    List<String> selectedPermissions = [];
    if (provideEstimation) selectedPermissions.add('Provide Estimation');
    if (createEmployee) selectedPermissions.add('Create Employee');
    if (editWorkFlow) selectedPermissions.add('Edit Work Flow');
    if (createOrder) selectedPermissions.add('Create Order');
    if (addProcesses) selectedPermissions.add('Add Processes');
    if (machineOperatorDashboard) selectedPermissions.add('Machine Operator Dashboard');
    return selectedPermissions;
  }
}
