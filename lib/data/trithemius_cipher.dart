class TrithemiusCipher {
  String encrypt({
    required String plaintext,
    required String alphabet,
    List<int>? key2D,
    List<int>? key3D,
    String? keyword,
  }) {
    if (!_validateKey(
      key2D: key2D,
      key3D: key3D,
      keyword: keyword,
      alphabet: alphabet,
    )) {
      throw Exception('Invalid key');
    }

    String ciphertext = '';

    for (int i = 0; i < plaintext.length; i++) {
      int shift;

      if (key2D != null) {
        shift = (key2D[0] * i + key2D[1]) % alphabet.length;
      } else if (key3D != null) {
        shift = (key3D[0] * i * i + key3D[1] * i + key3D[2]) % alphabet.length;
      } else if (keyword != null) {
        int keywordCharIndex =
            alphabet.indexOf(keyword[i % keyword.length].toUpperCase());
        shift = keywordCharIndex % alphabet.length;
      } else {
        throw Exception('No key provided');
      }

      int charIndex = alphabet.indexOf(plaintext[i].toUpperCase());

      if (charIndex != -1) {
        int newCharIndex = (charIndex + shift) % alphabet.length;
        ciphertext += alphabet[newCharIndex];
      } else {
        ciphertext += plaintext[i];
      }
    }

    return ciphertext;
  }

  String decrypt({
    required String ciphertext,
    required String alphabet,
    List<int>? key2D,
    List<int>? key3D,
    String? keyword,
  }) {
    if (!_validateKey(
      key2D: key2D,
      key3D: key3D,
      keyword: keyword,
      alphabet: alphabet,
    )) {
      throw Exception('Invalid key');
    }

    String plaintext = '';

    for (int i = 0; i < ciphertext.length; i++) {
      int shift;

      if (key2D != null) {
        shift = (key2D[0] * i + key2D[1]) % alphabet.length;
      } else if (key3D != null) {
        shift = (key3D[0] * i * i + key3D[1] * i + key3D[2]) % alphabet.length;
      } else if (keyword != null) {
        int keywordCharIndex =
            alphabet.indexOf(keyword[i % keyword.length].toUpperCase());
        shift = keywordCharIndex % alphabet.length;
      } else {
        throw Exception('No key provided');
      }

      int charIndex = alphabet.indexOf(ciphertext[i].toUpperCase());

      if (charIndex != -1) {
        int newCharIndex =
            (charIndex - shift + alphabet.length) % alphabet.length;
        plaintext += alphabet[newCharIndex];
      } else {
        plaintext += ciphertext[i];
      }
    }

    return plaintext;
  }

  bool _validate2DKey(List<int>? key2D) {
    bool isValid = false;
    if (key2D != null) {
      isValid = key2D.length == 2;
    }
    return isValid;
  }

  bool _validate3DKey(List<int>? key3D) {
    bool isValid = false;
    if (key3D != null) {
      isValid = key3D.length == 3;
    }
    return isValid;
  }

  bool _validateKeyword(String? keyword, String alphabet) {
    bool isValid = false;
    if (keyword != null) {
      isValid = keyword.isNotEmpty &&
          keyword
              .split('')
              .every((char) => alphabet.contains(char.toUpperCase()));
    }
    return isValid;
  }

  bool _validateKey({
    required String alphabet,
    String? keyword,
    List<int>? key2D,
    List<int>? key3D,
  }) {
    if (key2D != null) {
      return _validate2DKey(key2D);
    } else if (key3D != null) {
      return _validate3DKey(key3D);
    } else if (keyword != null) {
      return _validateKeyword(keyword, alphabet);
    } else {
      return false;
    }
  }
}
