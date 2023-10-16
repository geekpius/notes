
class UserModel{
  final String username;
  final String password;
  final bool loggedIn;

  UserModel({required this.username, required this.password, required this.loggedIn,});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      password: json['password'],
      loggedIn: json['loggedIn'],
    );
  }

  UserModel copyWith({String? username, String? password, bool? loggedIn}) {
    return UserModel(
      password: password ?? this.password,
      username: username?? this.username,
      loggedIn: loggedIn?? this.loggedIn,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'username': username,
      'loggedIn': loggedIn,
    };
  }
}