import 'package:dio/dio.dart';

import '/API/params.dart';
import '/models/user.dart';
import '/models/user_register.dart';
import '/providers/app_providers.dart';

/// Builds the PATCH body from only the fields the profile form can edit.
///
/// The signup draft is reused as the form's backing store, so sending it
/// wholesale would also ship its placeholder values — notably `dni`, which
/// defaults to "123" and would overwrite the user's real document number.
Map<String, dynamic> _buildUpdateBody(UserRegister draft) {
  final Map<String, dynamic> body = {};

  void put(String key, dynamic value) {
    if (value == null) return;
    if (value is String && value.trim().isEmpty) return;
    body[key] = value;
  }

  put('nombre', draft.nombre);
  put('apellido', draft.apellido);
  put('telefono', draft.telefono);
  put('fechaNacimiento', draft.fechaNacimiento?.toUtc().toIso8601String());

  // Type left inferred on purpose: `Domicilio` is declared in both user.dart
  // and user_register.dart, so naming it here would be ambiguous.
  final domicilio = draft.domicilio;
  if (domicilio != null) {
    final Map<String, dynamic> address = {};
    if (domicilio.calle?.trim().isNotEmpty ?? false) {
      address['calle'] = domicilio.calle;
    }
    if (domicilio.numero != null) address['numero'] = domicilio.numero;
    if (domicilio.ciudad?.trim().isNotEmpty ?? false) {
      address['ciudad'] = domicilio.ciudad;
    }
    if (domicilio.provincia?.trim().isNotEmpty ?? false) {
      address['provincia'] = domicilio.provincia;
    }
    if (address.isNotEmpty) body['domicilio'] = address;
  }

  return body;
}

Future<bool> patchUser() async {
  final provider = AppProviders.userProviderDeaf;
  final currentUser = provider.currentUser;
  if (currentUser == null) return false;

  Dio dio = Dio();

  try {
    // Inside the try: userRegisterModel parses the draft map and can throw on
    // malformed values, and this must always resolve to a bool for the caller.
    final body = _buildUpdateBody(provider.userRegisterModel);
    if (body.isEmpty) return true;

    final response = await dio
        .patch(
          UserUrls.patchUserById + currentUser.id,
          data: body,
          options: Options(headers: getUserToken()),
        )
        .timeout(const Duration(seconds: 40));

    provider.setUser(User.fromJson(response.data["data"]));
    return true;
  } catch (_) {
    return false;
  }
}
