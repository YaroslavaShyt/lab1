import 'package:lab1/data/ceasar_cipher.dart';

class EncriptionService {
  EncriptionService({
    required CaesarCipher cipher,
  }) : _cipher = cipher;

  final CaesarCipher _cipher;

  String? enctyptUkrainian({
    required String data,
    required int shift,
  }) {
    try {
      final String encryptedData = _cipher.encrypt(
          data, shift, r'^[а-яА-ЯіїєґІЇЄҐ]+$', 'А', 'Я', 'а', 'я');
      return encryptedData;
    } catch (error) {
      return null;
    }
  }

  String? dectyptUkrainian({
    required String data,
    required int shift,
  }) {
    try {
      final String decryptedData = _cipher.decrypt(
          data, shift, r'^[а-яА-ЯіїєґІЇЄҐ]+$', 'А', 'Я', 'а', 'я');
      return decryptedData;
    } catch (error) {
      return null;
    }
  }

  String? enctyptEnglish({
    required String data,
    required int shift,
  }) {
    try {
      final String encryptedData = _cipher.encrypt(
          data, shift, r'^[a-zA-Z]+$', 'A', 'Z', 'a', 'z');
      return encryptedData;
    } catch (error) {
      return null;
    }
  }
  
   String? dectyptEnglish({
    required String data,
    required int shift,
  }) {
    try {
      final String decryptedData = _cipher.decrypt(
          data, shift, r'^[a-zA-Z]+$', 'A', 'Z', 'a', 'z');
      return decryptedData;
    } catch (error) {
      return null;
    }
  }
}
