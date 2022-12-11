part of 'credential_home_bloc.dart';

abstract class CredentialHomeState extends Equatable {
  const CredentialHomeState();

  @override
  List<Object> get props => [];
}

class CredentialHomeInitial extends CredentialHomeState {
  // final List<Enrollment> credentials;

  const CredentialHomeInitial();
}

class CredentialHomeLoading extends CredentialHomeState {}

class CredentialHomeResults extends CredentialHomeState {
  final List<Map<String, String>> credentials;

  const CredentialHomeResults(this.credentials);
}
