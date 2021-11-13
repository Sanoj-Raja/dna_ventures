class UserModel {
  String? name;
  String? email;
  String? password;
  String? phoneNumber;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
