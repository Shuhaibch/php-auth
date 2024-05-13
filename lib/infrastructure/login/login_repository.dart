import 'dart:convert';
import 'dart:developer';

import 'package:api_login/domain/config/api_end_point.dart';
import 'package:api_login/domain/login/model/user_model.dart';
import 'package:api_login/domain/login/model_service.dart';
import 'package:api_login/infrastructure/shared_preference/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LoginRepository extends LoginService {
  @override
  Future logginUser(String email, String passwd) async {
    final userDetail = {"email": email, "password": passwd};
    try {
      final response = await http.post(
        Uri.parse(ApiEndPoints.logIn),
        body: jsonEncode(userDetail),
        headers: {"Content-type": "application/json"},
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final LogIn user = LogIn.fromJson(jsonResponse);
        _saveToken(user.token);
        return user;
      } else {
        throw Exception();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<void> _saveToken(String token) async {
    SharedPreferenceService().saveToken(token);
  }
}
