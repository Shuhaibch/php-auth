import 'package:api_login/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/authentication/authentication_bloc.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context).add(UserAuthenticatedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is UserAuthenticatedLoadedState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
          } else if (state is UserAuthenticatedFailedState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          }
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
