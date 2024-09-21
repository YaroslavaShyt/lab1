import 'package:get_it/get_it.dart';
import 'package:lab1/app/services/user_service.dart';

final diManager = GetIt.I;


void initGetIt(){
  diManager.registerSingleton<UserService>(UserService());
}