class UserModel {
  UserModel({required this.email, required this.password});

  factory UserModel.fromJson(final Map<String, dynamic> json) =>
      UserModel(email: json['email'], password: json['password']);
  final String email;
  final String password;

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
