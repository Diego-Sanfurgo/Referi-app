import 'package:flutter/material.dart';
import 'package:referi_app/models/user_register.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final String _auxPass = '';
  UserModel? _currentUser;
  final UserRegister _userRegisterCompleteModel = UserRegister();

  final Map<String, dynamic> _userRegister = {
    "email": "",
    "password": "",
    "nombre": "",
    "apellido": "",
    "dni": "123",
    "telefono": "",
    // "fechaNacimiento": "",
    "fechaacimiento": "",
    "fotoperfil": "",
    "domicilio": {
      "calle": "",
      "numero": 0,
    }
  };

  UserRegister get userRegisterModel => UserRegister.fromJson(_userRegister);
  Map<String, dynamic> get userRegister => _userRegister;
  UserRegister get userRegisterCompleteModel => _userRegisterCompleteModel;

  String get auxPsw => _auxPass;

  UserModel? get currentUserModel => _currentUser;
  User? get currentUser => _currentUser?.user;

  setUserModel(UserModel value) {
    _currentUser = value;
    notifyListeners();
  }

  setUser(User user) {
    _currentUser!.user = user;
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
}
