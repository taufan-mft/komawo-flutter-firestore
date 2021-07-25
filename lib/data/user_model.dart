class UserModel {
  String name;
  String gender;
  String email;
  String phone;
  String? password;

  UserModel({
    required this.name,
    required this.gender,
    required this.email,
    required this.phone,
    this.password,
  });
}
