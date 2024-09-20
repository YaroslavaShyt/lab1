import 'package:lab1/data/user.dart';

class UserService{
  final User _user;

  UserService({required User user}): _user = user;

  User get userData => _user;
}