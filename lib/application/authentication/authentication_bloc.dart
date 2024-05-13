// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:api_login/domain/login/model/user_model.dart';
import 'package:api_login/infrastructure/shared_preference/shared_preference.dart';
import 'package:api_login/infrastructure/signin/signin_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../infrastructure/login/login_repository.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository _loginRepository;
  final SignInRepository _signUpRepository;
  AuthenticationBloc(this._loginRepository, this._signUpRepository)
      : super(AuthenticationInitial()) {
    //* authentication
     on<UserAuthenticatedEvent>((event, emit) {
      emit(UserAuthenticatedLoadingState());
      final String? token = SharedPreferenceService().getToken();
      if (token == null || token == '') {
        emit(const UserAuthenticatedFailedState(errorMessage: "Timed Out"));
      } else {
        Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
        final LogIn user = LogIn(status: true, token: "jwtDecodedToken['token']");
        emit(UserAuthenticatedLoadedState(user: user));
      }
    });

    //* Login
    on<LogInEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        await _loginRepository.logginUser(event.email, event.password);
        emit(LoginSuccessState(user: LogIn(status: true, token: 'token')));
      } catch (e) {
        print(e);
        emit(const LoginFailedState(errorMessage: "Error while loggin"));
      }
    });
    //* SignUp
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());
      try {
        final LogIn user =
            await _signUpRepository.signInUser(event.email, event.password);
        log(user.token);
        emit(SignUpSuccessState());
      } catch (e) {
        print(e);
        emit(const SignUpFailedState(errorMessage: "Error while signin"));
      }
    });
  }
}
