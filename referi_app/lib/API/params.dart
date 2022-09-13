const String baseUrl = "https://referiapp.com.ar";

abstract class AuthUrls {
  static const String postAuthLogin = "$baseUrl/v1/auth/login";
  static const String postAuthRegister = "$baseUrl/v1/auth/register";
  static const String postAuthRecover = "$baseUrl/v1/auth/recover";
}
abstract class UsersUrls {
  static const String postUser = "$baseUrl/v1/usuarios";
  static const String getUsers = "$baseUrl/v1/usuarios";
  static const String getUserById = "$baseUrl/v1/usuarios/";
  static const String patchUserById = "$baseUrl/v1/usuarios/";
  static const String deleteUserById = "$baseUrl/v1/usuarios/";
}

abstract class LocationUrls{
  static const String getLocalGeolocation = "https://apis.datos.gob.ar/georef/api/ubicacion?";
}
