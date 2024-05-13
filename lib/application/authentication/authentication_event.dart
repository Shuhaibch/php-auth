part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UserAuthenticatedEvent extends AuthenticationEvent {}

class SignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpEvent({required this.email, required this.password});
  
  @override
  List<Object> get props => [email,password];
}

class LogInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const LogInEvent({required this.email, required this.password});
  
  @override
  List<Object> get props => [email,password];
}
