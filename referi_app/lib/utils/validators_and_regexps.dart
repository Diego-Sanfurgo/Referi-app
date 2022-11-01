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
      return "Datos incorrectos";
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null) {
      return "Completar campo";
    }
    if (!Formatters.email.hasMatch(value)) {
      return "Correo electrónico erróneo";
    }

    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null) {
      return "Completar campo";
    }
    if (!Formatters.name.hasMatch(value)) {
      return "Datos incorrectos";
    }

    return null;
  }

  static String? defaultValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return "Completar campo.";
  }

  static String? passwordValidator(String? value) {
    String errorText = '';
    if (value == null) {
      return "Debe completar este campo.";
    }

    //Primero valido si las condiciones se cumplen
    if ((value.length >= 8 || value.length <= 12) &&
        (value.contains(RegExp(r'[A-Z]'), 0)) &&
        (value.contains(RegExp(r'[a-z]'), 0))) {
      return null;
    }

    //Si no se cumplen, entonces valido por cada condición y la agrego al texto
    if (value.length < 8 || value.length > 12) {
      errorText += errorText.contains('Debe')
          ? "\nDebe tener entre 8 y 12 caracteres."
          : "Debe tener entre 8 y 12 caracteres.";
    }

    if ((!value.contains(RegExp(r'[A-Z]'), 0)) ||
        (!value.contains(RegExp(r'[a-z]'), 0))) {
      errorText += errorText.contains('Debe')
          ? "\nDebe incluir mayúsculas y minúsculas."
          : "Debe incluir mayúsculas y minúsculas.";
    }

    return errorText;
  }
}
