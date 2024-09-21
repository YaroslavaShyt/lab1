import 'package:lab1/data/ceasar_cipher.dart';

class EncryptionService {
  EncryptionService({
    required CaesarCipher cipher,
  }) : _cipher = cipher;

  final CaesarCipher _cipher;

  String? encryptUkrainian({
    required String data,
    required int shift,
  }) {
    try {
      final String encryptedData = _cipher.encrypt(
          data, shift, r'^[а-яА-ЯіїєґІЇЄҐ]+$', 'А', 'Я', 'а', 'я', 33);
      return encryptedData;
    } catch (error) {
      return null;
    }
  }

  String? decryptUkrainian({
    required String data,
    required int shift,
  }) {
    try {
      final String decryptedData = _cipher.decrypt(
          data, shift, r'^[а-яА-ЯіїєґІЇЄҐ]+$', 'А', 'Я', 'а', 'я', 33);
      return decryptedData;
    } catch (error) {
      return null;
    }
  }

  String? encryptEnglish({
    required String data,
    required int shift,
  }) {
    try {
      final String encryptedData =
          _cipher.encrypt(data, shift, r'^[a-zA-Z]+$', 'A', 'Z', 'a', 'z', 26);
      return encryptedData;
    } catch (error) {
      return null;
    }
  }

  String? decryptEnglish({
    required String data,
    required int shift,
  }) {
    try {
      final String decryptedData =
          _cipher.decrypt(data, shift, r'^[a-zA-Z]+$', 'A', 'Z', 'a', 'z', 26);
      return decryptedData;
    } catch (error) {
      return null;
    }
  }
}
