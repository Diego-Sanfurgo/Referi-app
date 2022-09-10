const String baseUrl = "https://referiapp.com.ar";

abstract class AuthUrls {
  static const String postAuth = "$baseUrl/v1/auth";
  static const String getAuth = "$baseUrl/v1/auth";
  static const String postAuthRecover = "$baseUrl/v1/auth/recover";
}
abstract class UsersUrls {
  static const String postUser = "$baseUrl/v1/usuarios";
  static const String getUsers = "$baseUrl/v1/usuarios";
  static const String getUserById = "$baseUrl/v1/usuarios/";
  static const String patchUserById = "$baseUrl/v1/usuarios/";
  static const String deleteUserById = "$baseUrl/v1/usuarios/";
}
