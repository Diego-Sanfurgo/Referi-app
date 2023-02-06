import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:referi_app/views/activities/activity%20detail%20enrolled/alerts/alerts.dart';

import '../functions/get_status_data.dart';
import '/API/payments/get_fees_by_user_id.dart';

import '/models/enrollment.dart';
import '/models/activity_fee_payment.dart';

import '../../../../controllers/general_alert_controller.dart';
import '/API/associates/delete_associate.dart';
import '/controllers/navigation_controller.dart';

part 'activity_detail_enrolled_event.dart';
part 'activity_detail_enrolled_state.dart';

class ActivityDetailEnrolledBloc
    extends Bloc<ActivityDetailEnrolledEvent, ActivityDetailEnrolledState> {
  ActivityDetailEnrolledBloc() : super(ActivityDetailEnrolledInitial()) {
    on<LoadStatusEvent>((event, emit) async {
      List<ActivityFeePayment> payments = await getFeesByUserId();
      _statusData = getStatusData(event.enrollment, payments);

      if (_statusData == null) {
        emit(FailedToLoadStatus());
        return;
      }

      emit(ActivityStatusLoaded(_statusData!));
    });

    on<CancelInscriptionEvent>((event, emit) async {
      if (_statusData!["estado"] == "Deuda") {
        await ActivityDetailEnrolledAlert.cannotCancelDialog();
        return;
      }

      bool isConfirmed = await ActivityDetailEnrolledAlert.askConfirmation();
      if (!isConfirmed) return;

      GeneralAlert.showLoading();

      bool isOk = await deleteAssociate(event.enrollment.id);

      NavigationController.pop();

      if (isOk) {
        GeneralAlert.showToast("Has cancelado tu inscripción a esta actividad");
        NavigationController.pop();
        return;
      } else {
        GeneralAlert.showError(
            "Ocurrió un error al intentar cancelar tu inscripción. Intenta de nuevo más tarde");
      }
    });
  }
}

Map<String, String>? _statusData = {};
