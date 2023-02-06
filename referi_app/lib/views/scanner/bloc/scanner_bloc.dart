import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '/API/assistance/mark_assistance.dart';
import '/controllers/navigation_controller.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

String? _auxCode = '';
bool canScan = true;

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(ScannerInitial()) {
    on<ReadData>((event, emit) async {
      if (_auxCode == event.barcode.rawValue && !canScan) {
        return;
      }

      emit(ScannerReading());

      canScan = false;
      _auxCode = event.barcode.rawValue;
      Timer(const Duration(seconds: 3), () => canScan = true);
      bool ok = await postAttendance(_auxCode!);

      if (ok) {
        NavigationController.goTo(Routes.succesAttendance, popPage: true);
      }

      // emit(ScannerInitial());
    });
  }
}
