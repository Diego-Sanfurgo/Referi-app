part of 'password_edit_bloc.dart';

abstract class PasswordEditEvent extends Equatable {
  const PasswordEditEvent();

  @override
  List<Object> get props => [];
}

class SubmitChangePassword extends PasswordEditEvent {
  final String oldPassword;
  final String newPassword;

  const SubmitChangePassword(this.oldPassword, this.newPassword);
}
