import 'package:get_it/get_it.dart';
import 'package:lab1/app/services/encryption_service.dart';
import 'package:lab1/app/services/file_service.dart';
import 'package:lab1/app/services/user_service.dart';
import 'package:lab1/data/ceasar_cipher.dart';
import 'package:lab1/data/trithemius_cipher.dart';
import 'package:lab1/data/vigenere_cipher.dart';

final diManager = GetIt.I;

void initGetIt() {
  diManager.registerSingleton<UserService>(UserService());
  diManager.registerFactory<EncryptionService>(
    () => EncryptionService(
      caesarCipher: CaesarCipher(),
      trithemiusCipher: TrithemiusCipher(),
      vigenereCipher: VigenereCipher(),
    ),
  );
  diManager.registerFactory<FileService>(() => FileService());
}
