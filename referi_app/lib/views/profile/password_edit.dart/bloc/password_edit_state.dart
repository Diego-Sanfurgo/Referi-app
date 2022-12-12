part of 'password_edit_bloc.dart';

abstract class PasswordEditState extends Equatable {
  const PasswordEditState();

  @override
  List<Object> get props => [];
}

class PasswordEditInitial extends PasswordEditState {}

class PasswordEditLoading extends PasswordEditState {}

class PasswordEditError extends PasswordEditState {}
