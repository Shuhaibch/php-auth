// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:api_login/domain/config/api_end_point.dart';
import 'package:api_login/domain/signin/sign_in_service.dart';
import 'package:http/http.dart' as http;

import '../../domain/login/model/user_model.dart';
import '../shared_preference/shared_preference.dart';

class SignInRepository extends SignInService {
  @override
  Future signInUser(String email, String password) async {
    final signUpUserDetails = {
      "email": email,
      "password": password,
    };
    log(signUpUserDetails.toString());
    try {
      var response = await http.post(
        Uri.parse(ApiEndPoints.signIn),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          signUpUserDetails,
        ),
      );

      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responceBody = jsonDecode(response.body);
        final LogIn user = LogIn.fromJson(responceBody);
        return user;
      } else {
        throw Exception(response.body);
      }
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> _saveToken(String token) async {
    SharedPreferenceService().saveToken(token);
  }
}
