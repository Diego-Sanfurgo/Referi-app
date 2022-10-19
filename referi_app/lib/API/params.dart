const String baseUrl = "https://referiapp.com.ar/v1";

abstract class AuthUrls {
  static const String postAuthLogin = "$baseUrl/auth/login";
  static const String postAuthRegister = "$baseUrl/auth/register";
  static const String postAuthRecover = "$baseUrl/auth/recover";
}

abstract class UserUrls {
  static const String postUser = "$baseUrl/usuarios";
  static const String getUsers = "$baseUrl/usuarios";
  static const String getUserById = "$baseUrl/usuarios/";
  static const String patchUserById = "$baseUrl/usuarios/";
  static const String deleteUserById = "$baseUrl/usuarios/";
}

abstract class LocationUrls {
  static const String getLocalGeolocation =
      "https://apis.datos.gob.ar/georef/api/ubicacion?";
}

abstract class OrganizationUrls {
  static const String getOrganizations = "$baseUrl/organizaciones";
  static const String getOrganizationById = "$baseUrl/organizaciones/";
}

abstract class ActivityUrls {
  static const String postInscripcion = "$baseUrl/actividades/inscribir";
  static const String getActivities = "$baseUrl/actividades/tipo";
  static const String getActivityById = "$baseUrl/actividades/";
}

abstract class NotificationUrls {
  static const String getNotificationsById = "$baseUrl/notificaciones/";
  static const String getNotifications = "$baseUrl/notificaciones";
}

abstract class AssistanceUrls {
  static const String postAssistance = "$baseUrl/asistencias/crear";
}
