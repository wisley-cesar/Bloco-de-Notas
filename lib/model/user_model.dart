class UserModel {
  final String username;
  final int id;
  String? token;

  UserModel({
    required this.username,
    required this.id,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': username,
      'id': id,
    };
  }

  void setToken(String newToken) {
    token = newToken;
  }
}
