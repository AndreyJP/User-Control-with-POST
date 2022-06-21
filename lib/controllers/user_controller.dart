import 'package:user_control/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:user_control/components/alert_dialog.dart';

class UserController {
  static final UserController instance = UserController();

  static const request = 'https://reqres.in/api/register';

  createUser(User user, BuildContext context) async {
    http.Response response = await createUserAPI(user);

    print(response.body);

    Map answer = json.decode(response.body);

    if (answer['error'] != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert(
              context, 'Erro ao realizar cadastrar usuário', answer['error']);
        },
      );
    } else if (answer['id'] != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert(context, 'Usuário cadastrado com sucesso',
              'ID do usuário: ${answer['id']}');
        },
      );
    }
  }

  Future<http.Response> createUserAPI(User user) {
    return http.post(
      Uri.parse(request),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': user.getUsername(),
        'email': user.getEmail(),
        'password': user.getPassword()
      }),
    );
  }
}
