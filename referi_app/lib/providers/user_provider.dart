import 'package:flutter/material.dart';

import '../models/user.dart';
import '/models/user_register.dart';

Map<String, dynamic> _emptyUserRegister() => {
      "email": "",
      "password": "",
      "nombre": "",
      "apellido": "",
      // UserRegister.fromJson runs int.parse on this, so it can't be empty.
      "dni": "123",
      "telefono": "",
      "fechanacimiento": "",
      "fotoperfil": "",
      "domicilio": {
        "calle": "",
        "numero": 0,
      }
    };

class UserProvider extends ChangeNotifier {
  final String _auxPass = '';
  UserModel? _currentUser;
  final UserRegister _userRegisterCompleteModel = UserRegister();

  final Map<String, dynamic> _userRegister = _emptyUserRegister();

  UserRegister get userRegisterModel => UserRegister.fromJson(_userRegister);
  Map<String, dynamic> get userRegister => _userRegister;
  UserRegister get userRegisterCompleteModel => _userRegisterCompleteModel;

  String get auxPsw => _auxPass;

  UserModel? get currentUserModel => _currentUser;
  User? get currentUser => _currentUser?.user;

  String get currentUserId {
    final user = currentUser;
    if (user == null) throw StateError('No authenticated user');
    return user.id;
  }

  setUserModel(UserModel value) {
    _currentUser = value;
    notifyListeners();
  }

  setUser(User user) {
    _currentUser!.user = user;
    notifyListeners();
  }

  // Clears the draft too: it backs the profile form, so stale values would be
  // submitted under the next account that signs in.
  clearSession() {
    _currentUser = null;
    _userRegister
      ..clear()
      ..addAll(_emptyUserRegister());
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
