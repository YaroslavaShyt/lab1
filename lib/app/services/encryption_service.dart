import 'package:lab1/data/ceasar_cipher.dart';
import 'package:lab1/data/ciphers.dart';
import 'package:lab1/data/trithemius_cipher.dart';
import 'package:lab1/data/vigenere_cipher.dart';

class EncryptionService {
  EncryptionService({
    required CaesarCipher caesarCipher,
    required TrithemiusCipher trithemiusCipher,
    required VigenereCipher vigenereCipher,
  })  : _caesarCipher = caesarCipher,
        _vigenereCipher = vigenereCipher,
        _trithemiusCipher = trithemiusCipher;

  final CaesarCipher _caesarCipher;
  final TrithemiusCipher _trithemiusCipher;
  final VigenereCipher _vigenereCipher;

  String? encryptUkrainian({
    required String data,
    int? shift,
    List<int>? key2D,
    List<int>? key3D,
    String? keyword,
    Ciphers cipher = Ciphers.ceasar,
  }) {
    try {
      return switch (cipher) {
        Ciphers.ceasar => _caesarCipher.encrypt(
            data, shift!, r'^[а-яА-ЯіїєґІЇЄҐ]+$', 'А', 'Я', 'а', 'я', 33),
        Ciphers.trithemius => _trithemiusCipher.encrypt(
            plaintext: data,
            alphabet: 'АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЬЮЯ',
            key2D: key2D,
            key3D: key3D,
            keyword: keyword,
          ),
        Ciphers.vigenere => _vigenereCipher.encrypt(
            data,
            keyword!,
          ),
      };
    } catch (error) {
      return null;
    }
  }

  String? decryptUkrainian({
    required String data,
    required int shift,
    List<int>? key2D,
    List<int>? key3D,
    String? keyword,
    Ciphers cipher = Ciphers.ceasar,
  }) {
    try {
      return switch (cipher) {
        Ciphers.ceasar => _caesarCipher.decrypt(
            data, shift, r'^[а-яА-ЯіїєґІЇЄҐ]+$', 'А', 'Я', 'а', 'я', 33),
        Ciphers.trithemius => _trithemiusCipher.decrypt(
            ciphertext: data,
            alphabet: 'АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЬЮЯ',
            key2D: key2D,
            key3D: key3D,
            keyword: keyword,
          ),
        Ciphers.vigenere => _vigenereCipher.decrypt(
            data,
            keyword!,
          ),
      };
    } catch (error) {
      return null;
    }
  }

  String? encryptEnglish({
    required String data,
    required int shift,
    List<int>? key2D,
    List<int>? key3D,
    String? keyword,
    Ciphers cipher = Ciphers.ceasar,
  }) {
    try {
      return switch (cipher) {
        Ciphers.ceasar => _caesarCipher.encrypt(
            data, shift, r'^[a-zA-Z]+$', 'A', 'Z', 'a', 'z', 26),
        Ciphers.trithemius => _trithemiusCipher.encrypt(
            plaintext: data,
            alphabet: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
            key2D: key2D,
            key3D: key3D,
            keyword: keyword,
          ),
        Ciphers.vigenere => _vigenereCipher.encrypt(
            data,
            keyword!,
          ),
      };
    } catch (error) {
      return null;
    }
  }

  String? decryptEnglish({
    required String data,
    required int shift,
    List<int>? key2D,
    List<int>? key3D,
    String? keyword,
    Ciphers cipher = Ciphers.ceasar,
  }) {
    try {
      return switch (cipher) {
        Ciphers.ceasar => _caesarCipher.decrypt(
            data, shift, r'^[a-zA-Z]+$', 'А', 'Я', 'а', 'я', 33),
        Ciphers.trithemius => _trithemiusCipher.decrypt(
            ciphertext: data,
            alphabet: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
            key2D: key2D,
            key3D: key3D,
            keyword: keyword,
          ),
        Ciphers.vigenere => _vigenereCipher.decrypt(
            data,
            keyword!,
          ),
      };
    } catch (error) {
      return null;
    }
  }
}
