class UserModel {
  String name;
  String sname;
  String address;
  String radius;
  String status;
  List<String> business;
  String description;
  UserModel({
    required this.name,
    required this.sname,
    required this.status,
    required this.address,
    required this.business,
    required this.radius,
    required this.description,
  });
}
