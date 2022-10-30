import 'package:flutter/material.dart';
import 'package:referi_app/models/user_register.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final String _auxPass = '';
  UserModel? _currentUser;
  final Map<String, dynamic> _userRegister = {
    "email": "",
    "password": "",
    "nombre": "",
    "apellido": "",
    "dni": 0,
    "telefono": "",
    "fechaNacimiento": "",
    "fotoPerfil": "",
    "domicilio": {
      "calle": "",
      "numero": 0,
    }
  };
  bool _progressBarFirstCompleted = false;
  bool _progressBarSecondCompleted = false;
  bool _progressBarThirdompleted = false;

  bool get progressBarFirstCompleted => _progressBarFirstCompleted;
  bool get progressBarSecondCompleted => _progressBarSecondCompleted;
  bool get progressBarThirdCompleted => _progressBarThirdompleted;

  final ValueNotifier<bool> _isFormValid = ValueNotifier(false);
  ValueNotifier<bool> get isFormValid => _isFormValid;

  UserRegister get userRegisterModel => UserRegister.fromJson(_userRegister);
  Map<String, dynamic> get userRegister => _userRegister;

  String get auxPsw => _auxPass;

  UserModel? get currentUserModel => _currentUser;
  User? get currentUser => _currentUser?.user;

  setUser(UserModel value) {
    _currentUser = value;
    notifyListeners();
  }

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
    if (label == "calle" ||
        label == "numero" ||
        label == "ciudad" ||
        label == "provincia") {
      final Map<String, dynamic> domicilio = _userRegister['domicilio'];
      domicilio[label] = value;
      _userRegister.addAll({'domicilio': domicilio});
      return;
    }
    _userRegister.addAll({label: value});
  }

  setFormValidation(bool value) => _isFormValid.value = value;
}
