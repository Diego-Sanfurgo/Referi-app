import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:equatable/equatable.dart';

import '/models/enrollment.dart';
import '/models/activity_fee_payment.dart';
import '/API/payments/get_fees_by_user_id.dart';
import '/API/associates/get_user_activities.dart';

part 'credential_home_event.dart';
part 'credential_home_state.dart';

class CredentialHomeBloc
    extends Bloc<CredentialHomeEvent, CredentialHomeState> {
  CredentialHomeBloc() : super(const CredentialHomeInitial()) {
    on<FetchCredentials>((event, emit) async {
      _payments = await getFeesByUserId();
      _credentials = await getUserEnrollments();

      List<Map<String, String>> enrollments = _buildData();

      emit(CredentialHomeResults(enrollments));
    });

    on<FetchUserFees>((event, emit) async {});
  }
}

List<Enrollment> _credentials = [];
List<ActivityFeePayment> _payments = [];

List<Map<String, String>> _buildData() {
  List<Map<String, String>> enrollments = [];

  for (var enrollment in _credentials) {
    bool alreadyInList = enrollments
        .any((element) => element["orgId"] == enrollment.organizacion.id);
    if (alreadyInList) continue;

    Map<String, String> enrollmentData = {
      "orgName": enrollment.organizacion.nombre,
      "orgId": enrollment.organizacion.id,
    };

    bool hasElements = _payments.any((element) =>
        element.actividad.id == enrollment.turnoActividad.actividad.id);

    if (!hasElements) continue;

    ActivityFeePayment? payment = _payments.firstWhere((element) =>
        element.actividad.id == enrollment.turnoActividad.actividad.id);
    bool isExpired = DateTime.now().isAfter(payment.fechaVencimiento);

    if (!isExpired || payment.pago != null) {
      enrollmentData.addAll({"estado": "Activo"});
    } else {
      enrollmentData.addAll({"estado": "Deuda"});
    }
    enrollmentData.addAll(
        {"vto": DateFormat.yMd("es, ES").format(payment.fechaVencimiento)});

    enrollments.add(enrollmentData);
  }
  return enrollments;
}
