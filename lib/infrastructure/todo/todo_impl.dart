import 'dart:convert';
import 'dart:developer';

import 'package:api_login/domain/config/api_end_point.dart';
import 'package:api_login/domain/todo/todo_service.dart';
import 'package:http/http.dart' as http;

class TodoImpli implements TodoService {
  @override
  Future createTodo(String userId, String title, String disc) async {
    final todo = {
      "userId": userId,
      "title": title,
      "discription": disc,
    };
    try {
      var responce = await http.post(
        Uri.parse(ApiEndPoints.createTodo),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          todo,
        ),
      );
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        return {'status': true, "data": "success"};
      } else {
        return {'status': false, "data": "Sending Error"};
      }
    } catch (e) {
      log(e.toString());
      return;
    }
  }
}
