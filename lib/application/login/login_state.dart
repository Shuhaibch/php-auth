part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final LogIn user;

  const LoginSuccess({required this.user});
}

class LoginFailed extends LoginState {}

class LoginLoading extends LoginState {}
