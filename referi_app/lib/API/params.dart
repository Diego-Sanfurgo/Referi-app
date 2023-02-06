import 'package:referi_app/providers/app_providers.dart';

const String _baseUrl = "https://referiapp.com.ar/v1";

abstract class AuthUrls {
  static const String postLogin = "$_baseUrl/auth/login";
  static const String postRegister = "$_baseUrl/auth/register";
  static const String postRecover = "$_baseUrl/auth/recover";
  static const String postVerify = "$_baseUrl/auth/verify";
  static const String postChangePassword = "$_baseUrl/auth/change_password";
}

abstract class UserUrls {
  static const String postUser = "$_baseUrl/usuarios";
  static const String getUsers = "$_baseUrl/usuarios";
  static const String getUserById = "$_baseUrl/usuarios/";
  static const String patchUserById = "$_baseUrl/usuarios/";
  static const String deleteUserById = "$_baseUrl/usuarios/";
}

abstract class LocationUrls {
  static const String getLocalGeolocation =
      "https://apis.datos.gob.ar/georef/api/ubicacion?";
}

abstract class OrganizationUrls {
  static const String getOrganizations = "$_baseUrl/organizaciones";
  static const String getOrganizationById = "$_baseUrl/organizaciones/";
}

abstract class ActivityUrls {
  // static const String postInscripcion = "$_baseUrl/actividades/inscribir";
  static const String getActivities = "$_baseUrl/actividades/tipo";
  static const String getActivityTypeById = "$_baseUrl/actividades/tipo/";
  static const String getActivityById = "$_baseUrl/actividades/";
  static const String getActivitiesByOrg =
      "$_baseUrl/actividades/organizacion/";
}

abstract class NotificationUrls {
  // static const String getNotificationsById = "$_baseUrl/notificaciones/";
  static const String getNotificationsByUserId =
      "$_baseUrl/notificaciones/socios/";
  // static const String getNotifications = "$_baseUrl/notificaciones";
  static const String postNotificationRead = "$_baseUrl/notificaciones/read/";
}

abstract class AssistanceUrls {
  static const String postAssistance = "$_baseUrl/asistencias/crear";
}

abstract class ImageUrls {
  static const String postImage = "$_baseUrl/uploads";
  static const String getImage = "$_baseUrl/uploads/";
  static const String deleteImage = "$_baseUrl/uploads/";
  static const String urlToUserImage = "$_baseUrl/";
}

abstract class ShiftUrls {
  static const String getShiftById = "$_baseUrl/actividades/turno/";
}

abstract class AssociatesUrls {
  static const enrollUserToActivity = "$_baseUrl/socios";
  static const getEnrollmentsByUserId = "$_baseUrl/socios/usuario/";
  static const getActivitiesById = "$_baseUrl/socios/actividad/";
  static const deleteEnrollmentByAssociateId = "$_baseUrl/socios/";
}

abstract class PaymentUrls {
  static const postPayFee = "$_baseUrl/pagos";
  static const getPaymentById = "$_baseUrl/pagos/";
  static const getFeesByUserId = "$_baseUrl/pagos/cuotas/usuario/";
}

abstract class FeeUrls {
  static const getFeesByactivityId = "$_baseUrl/tarifas/actividad/";
}

Map<String, String> getUserToken() {
  String token = AppProviders.userProviderDeaf.currentUserModel!.accessToken;
  return {"Authorization": "bearer $token"};
}
