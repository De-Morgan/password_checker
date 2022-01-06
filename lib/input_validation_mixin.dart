



mixin InputValidatorMixin {
  bool isPasswordValid(String password) {
    if (password.trim().isEmpty) return false;
    return RegExp(
        r"(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})")
        .hasMatch(password);
  }

  bool isPasswordValidRelax(String password) => password.trim().isNotEmpty;

  bool hasOneUppercase(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(r'(?=.*[A-Z])').hasMatch(text);
  }
  
  bool hasOneLowercase(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(r'(?=.*[a-z])').hasMatch(text);
  }

  bool hasOneSymbol(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(
        r'^(?=.*?[)(\][)(|:};{?.="\u0027%!+<@>#\$/&*~^_-`,\u005C\u002D])')
        .hasMatch(text);
  }

  bool hasAtLeast8cha(String text) {
    if (text.trim().isEmpty) return false;
    return text.length > 7;
  }

  bool hasOneDigit(String text) {
    if (text.trim().isEmpty) return false;
    return RegExp(r'^(?=.*?[0-9])').hasMatch(text);
  }
}
