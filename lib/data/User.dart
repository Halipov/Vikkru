final String tableUsers = 'Users';
final String colUsersID = 'UserID';
final String colUsersLogin = 'Login';
final String colUsersPassword = 'Password';

class User {
  int userId;
  String login;
  String password;

  User({this.login, this.password});

  User.fromMap(Map<dynamic, dynamic> map) {
    userId = map[colUsersID];
    login = map[colUsersLogin];
    password = map[colUsersPassword];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colUsersID: userId,
      colUsersLogin: login,
      colUsersPassword: password
    };
    return map;
  }

  Map toJson() =>
      {colUsersID: userId, colUsersLogin: login, colUsersPassword: password};

  @override
  String toString() {
    return 'user(userid: $userId, login: $login, password: $password}';
  }
}
