part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

//* Authentication
class UserAuthenticatedLoadedState extends AuthenticationState {
  final LogIn user;

  const UserAuthenticatedLoadedState({required this.user});
}

class UserAuthenticatedLoadingState extends AuthenticationState {}

class UserAuthenticatedFailedState extends AuthenticationState {
  final String errorMessage;

  const UserAuthenticatedFailedState({required this.errorMessage});
}

//* Login
class LoginSuccessState extends AuthenticationState {
  final LogIn user;

  const LoginSuccessState({required this.user});
}

class LoginLoadingState extends AuthenticationState {}

class LoginFailedState extends AuthenticationState {
  final String errorMessage;

  const LoginFailedState({required this.errorMessage});
}

//* SignUp
class SignUpSuccessState extends AuthenticationState {}

class SignUpLoadingState extends AuthenticationState {}

class SignUpFailedState extends AuthenticationState {
  final String errorMessage;

  const SignUpFailedState({required this.errorMessage});
}
