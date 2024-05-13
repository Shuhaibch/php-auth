import 'package:api_login/application/authentication/authentication_bloc.dart';
import 'package:api_login/application/login/login_bloc.dart';
import 'package:api_login/application/signup/sign_up_bloc.dart';
import 'package:api_login/domain/login/model_service.dart';
import 'package:api_login/domain/signin/sign_in_service.dart';
import 'package:api_login/infrastructure/login/login_repository.dart';
import 'package:api_login/infrastructure/signin/signin_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configerInjection() async {
  getIt.registerLazySingleton<SignInRepository>(() => SignInRepository());
  getIt.registerLazySingleton<SignInService>(() => SignInRepository());
  getIt.registerLazySingleton<SignUpBloc>(() => SignUpBloc(getIt()));
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository());
  getIt.registerLazySingleton<LoginService>(() => LoginRepository());
  getIt.registerLazySingleton<LoginBloc>(
      () => LoginBloc(loginRepository: getIt()));
  getIt.registerLazySingleton<AuthenticationBloc>(
      () => AuthenticationBloc(getIt(), getIt()));
}
