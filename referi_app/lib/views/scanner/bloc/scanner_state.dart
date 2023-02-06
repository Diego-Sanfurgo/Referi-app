part of 'scanner_bloc.dart';

abstract class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

class ScannerInitial extends ScannerState {}

class ScannerReading extends ScannerState {}

class ScannerReadingSuccess extends ScannerState {}

class ScannerReadingError extends ScannerState {}
