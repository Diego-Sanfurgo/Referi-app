part of 'scanner_bloc.dart';

abstract class ScannerEvent extends Equatable {
  const ScannerEvent();

  @override
  List<Object> get props => [];
}

class ReadData extends ScannerEvent {
  final Barcode barcode;
  final MobileScannerController controller;

  const ReadData(this.barcode, this.controller);
}
