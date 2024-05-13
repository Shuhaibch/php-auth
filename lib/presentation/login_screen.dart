import 'package:api_login/application/authentication/authentication_bloc.dart';
import 'package:api_login/domain/config/string.dart';
import 'package:api_login/presentation/home/home_screen.dart';
import 'package:api_login/presentation/signin_screen.dart';
import 'package:api_login/presentation/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';
import 'widget/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  bool isvalidate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Log in Screen ",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: width * .9,
              child: CustTextFeild(
                errorText: isvalidate ? null : "Enter valid content",
                controller: emailCtrl,
                prefixIcon: const Icon(Icons.mail_outline_outlined),
                hintText: "Email",
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Fill the Field';
                  } else if (!emailRexExp.hasMatch(val)) {
                    return 'Please Enter a Valid Email';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * .9,
              child: CustTextFeild(
                errorText: isvalidate ? null : "Enter valid content",
                controller: passCtrl,
                prefixIcon: const Icon(Icons.lock),
                hintText: "Password",
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please Fill the Feild';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                if (emailCtrl.text.isNotEmpty && passCtrl.text.isNotEmpty) {
                  context.read<AuthenticationBloc>().add(LogInEvent(
                      email: emailCtrl.text, password: passCtrl.text));
                }
              },
              child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
                  } else if (state is LoginFailedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Error while Login")));
                  }
                },
                builder: (context, state) {
                  return CustButton(title: "Log in");
                },
              ),
            ),
            InkWell(
                onTap: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
