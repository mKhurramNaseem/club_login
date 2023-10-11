extension Modification on String? {
  static const int fromNull = 0;
  static const int fromCharacters = 1;
  static const int fromLength = 2;

  bool? isNameString() {
    if (this?.isEmpty ?? true) {
      return null;
    }
    return this
        ?.toUpperCase()
        .codeUnits
        .every((element) => isUpperCaseAlphabet(element));
  }

  bool isUpperCaseAlphabet(int element) {
    return (element >= 'A'.codeUnits[0] && element <= 'Z'.codeUnits[0]) ||
        element == ' '.codeUnits[0];
  }

  bool? isEmailString() {
    if (this?.isEmpty ?? true) {
      return null;
    }
    return this?.contains('@gmail.com');
  }

  (bool, int) isPhoneNoString() {
    if (this == null || this!.isEmpty) {
      return (false, fromNull);
    }
    if (this!.codeUnits.every((element) => element >= 48 && element <= 57)) {
      if (this!.length == 11) {
        return (true, fromCharacters | fromLength);
      } else {
        return (false, fromLength);
      }
    }
    return (false, fromCharacters);
  }
}
