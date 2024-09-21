import 'package:get_it/get_it.dart';
import 'package:lab1/app/services/encryption_service.dart';
import 'package:lab1/app/services/file_service.dart';
import 'package:lab1/app/services/user_service.dart';
import 'package:lab1/data/ceasar_cipher.dart';

final diManager = GetIt.I;

void initGetIt() {
  diManager.registerSingleton<UserService>(UserService());
  diManager.registerFactory<EncryptionService>(
    () => EncryptionService(
      cipher: CaesarCipher(),
    ),
  );
  diManager.registerFactory<FileService>(() => FileService());
}
