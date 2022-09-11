import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final Map<String, dynamic> _userRegister = {
    "email": "",
    "password": "string",
    "nombre": "string",
    "apellido": "string",
    "dni": 0,
    "telefono": "string",
    "fechaNacimiento": "2022-09-11T06:08:48.701Z",
    "fotoPerfil": "string",
    "domicilio": {
      "calle": "",
      "numero": 123,
    }
  };
  bool _progressBarFirstCompleted = false;
  bool _progressBarSecondCompleted = false;
  bool _progressBarThirdompleted = false;

  bool get progressBarFirstCompleted => _progressBarFirstCompleted;
  bool get progressBarSecondCompleted => _progressBarSecondCompleted;
  bool get progressBarThirdCompleted => _progressBarThirdompleted;

  User get userRegister => User.fromJson(_userRegister);

  setProgressBarValue(bool value, int num) {
    if (num == 1) {
      _progressBarFirstCompleted = value;
    } else if (num == 2) {
      _progressBarSecondCompleted = value;
    } else if (num == 3) {
      _progressBarThirdompleted = value;
    }
    notifyListeners();
  }

  addValueToUserRegister(String value, String label) {
    if (label == "calle" || label == "numero") {
      _userRegister.addAll({
        "Domicilio": {label: value}
      });
    }
    _userRegister.addAll({label.toLowerCase(): value});
  }
}
