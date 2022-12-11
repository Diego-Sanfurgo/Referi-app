part of 'credential_home_bloc.dart';

abstract class CredentialHomeEvent extends Equatable {
  const CredentialHomeEvent();

  @override
  List<Object> get props => [];
}

class FetchCredentials extends CredentialHomeEvent {}

class FetchUserFees extends CredentialHomeEvent {}
