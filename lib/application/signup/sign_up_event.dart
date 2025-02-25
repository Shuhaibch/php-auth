part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequired extends SignUpEvent {
  final String email;
  final String password;

  const SignUpRequired({
    required this.email,
    required this.password,
  });
}
