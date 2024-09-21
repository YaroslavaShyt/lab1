class CaesarCipher {
  bool validateKey(int key, int max) {
    return key > 0 && key < max;
  }

  bool validateData(String data, String pattern) {
    return data.isNotEmpty && RegExp(pattern).hasMatch(data);
  }

  String encrypt(
    String data,
    int shift,
    String pattern,
    String startUpper,
    String endUpper,
    String startLower,
    String endLower,
    int max,
  ) {
    if (!validateData(data, pattern)) {
      throw ArgumentError(
          'Invalid data: Only alphabetic characters are allowed.');
    }

    if(!validateKey(shift, max)){
      throw ArgumentError('Invalid key');
    }

    return data.split('').map((char) {
      if (char.toUpperCase() == char) {
        return _shiftChar(char, shift, startUpper, endUpper);
      } else {
        return _shiftChar(char, shift, startLower, endLower);
      }
    }).join('');
  }

  String decrypt(
    String data,
    int shift,
    String pattern,
    String startUpper,
    String endUpper,
    String startLower,
    String endLower,
    int max,
  ) {
    if (!validateData(data, pattern)) {
      throw ArgumentError(
          'Invalid data: Only alphabetic characters are allowed.');
    }

      if (!validateKey(shift, max)) {
      throw ArgumentError('Invalid key');
    }

    return data.split('').map((char) {
      if (char.toUpperCase() == char) {
        return _shiftChar(char, -shift, startUpper, endUpper);
      } else {
        return _shiftChar(char, -shift, startLower, endLower);
      }
    }).join('');
  }

  String _shiftChar(String char, int shift, String start, String end) {
    int startCode = start.codeUnitAt(0);
    int endCode = end.codeUnitAt(0);
    int charCode = char.codeUnitAt(0);

    int shiftedCode = charCode + shift;

    if (shiftedCode > endCode) {
      shiftedCode = startCode + (shiftedCode - endCode - 1);
    } else if (shiftedCode < startCode) {
      shiftedCode = endCode - (startCode - shiftedCode - 1);
    }

    return String.fromCharCode(shiftedCode);
  }
}
