import 'package:api_login/application/authentication/authentication_bloc.dart';
import 'package:api_login/domain/config/theme.dart';
import 'package:api_login/infrastructure/login/login_repository.dart';
import 'package:api_login/infrastructure/shared_preference/shared_preference.dart';
import 'package:api_login/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/config/di/injectable.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configerInjection();
  await SharedPreferenceService.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(
    loginRepository: LoginRepository(),
  ));
}

var width;
var height;

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.loginRepository});
  final LoginRepository loginRepository;
  @override
  Widget build(BuildContext context) {
    width ??= MediaQuery.of(context).size.width;
    height ??= MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthenticationBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home:  const SplashScreen(),
      ),
    );
  }
}
