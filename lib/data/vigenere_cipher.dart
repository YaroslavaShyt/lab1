class VigenereCipher {
  final String _alphabet =
      'АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЬЮЯ'; //'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  String encrypt(String message, String verse) {
    String key = _generateKey(message, verse);
    return _cipher(message, key, isEncrypting: true);
  }

  String decrypt(String encryptedMessage, String verse) {
    String key = _generateKey(encryptedMessage, verse);
    return _cipher(encryptedMessage, key, isEncrypting: false);
  }

  String _generateKey(String message, String verse) {
    verse = verse.toUpperCase().replaceAll(RegExp(r'\s+'), '');
    int verseLength = verse.length;
    StringBuffer key = StringBuffer();

    int keyIndex = 0;
    for (int i = 0; i < message.length; i++) {
      if (_alphabet.contains(message[i].toUpperCase())) {
        key.write(verse[keyIndex % verseLength]);
        keyIndex++;
      } else {
        key.write(message[i]);
      }
    }

    return key.toString();
  }

  String _cipher(String text, String key, {required bool isEncrypting}) {
    StringBuffer result = StringBuffer();
    int shiftDirection = isEncrypting ? 1 : -1;

    for (int i = 0; i < text.length; i++) {
      String char = text[i].toUpperCase();

      if (_alphabet.contains(char)) {
        int textIndex = _alphabet.indexOf(char);
        int keyIndex = _alphabet.indexOf(key[i].toUpperCase());
        int shiftedIndex =
            (textIndex + shiftDirection * keyIndex) % _alphabet.length;

        if (shiftedIndex < 0) {
          shiftedIndex += _alphabet.length;
        }

        result.write(_alphabet[shiftedIndex]);
      } else {
        result.write(char);
      }
    }

    return result.toString();
  }
}
