import 'dart:developer';

import 'package:api_login/infrastructure/login/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/login/model/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;
  LoginBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(LoginInitial()) {
    on<LoginRequired>((event, emit) async {
      emit(LoginLoading());
      try {
        final  user =
            await _loginRepository.logginUser(event.email, event.password);
        emit(LoginSuccess(user: user));
      } catch (e) {
        log(e.toString());
        emit(LoginFailed());
      }
    });
  }
}
