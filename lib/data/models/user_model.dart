class UserModel {
  final String id;
  final String name;
  final String email;


  UserModel({
    required this.id,
    required this.name,
    required this.email,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': name,
      'email': email,

    };
  }
}