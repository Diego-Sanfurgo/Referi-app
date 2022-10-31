abstract class Formatters {
  static final RegExp name = RegExp(
      r'([^0-9\.\,\"\?\!\;\:\#\$\%\&\(\)\*\+\-\/\<\>\=\@\[\]\\\^\_\{\}\|\~]+)');

  static final RegExp numbers = RegExp(r"[^a-z ]\ *([.0-9])*\d");
  static final RegExp email = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
}

abstract class Validators {
  static String? numberValidator(String? value) {
    if (value == null) {
      return "Completar campo";
    }
    if (!Formatters.numbers.hasMatch(value)) {
      return "Completar campo correctamente";
    }

    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null) {
      return "Completar campo";
    }
    if (!Formatters.name.hasMatch(value)) {
      return "Completar campo correctamente";
    }

    return null;
  }

  static String? defaultValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return "Completar campo.";
  }
}
