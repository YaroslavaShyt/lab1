import 'package:lab1/data/user.dart';

class UserService {
  User? _user;

  User? get userData => _user;

  bool setUser({
    String name = "name",
    String surname = "surname",
    String group = "TV-13",
  }) {
    if (name.isNotEmpty && surname.isNotEmpty && group.isNotEmpty) {
      _user = User(
        group: group,
        name: name,
        surname: surname,
      );
      return true;
    }
    return false;
  }
}
