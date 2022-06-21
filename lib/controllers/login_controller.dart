import 'package:user_control/models/user.dart';
import 'package:user_control/components/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LoginController {
  static final LoginController instance = LoginController();

  static const request = 'https://reqres.in/api/login';

  void login(String email, String password, BuildContext context) async {
    http.Response response = await loginUserAPI(email, password);

    print(response.body);

    Map answer = json.decode(response.body);

    if (answer['error'] != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert(
              context, 'Erro ao realizar login', answer['error']);
        },
      );
    } else if (answer['token'] != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert(context, 'Login realizado com sucesso',
              'Token do usuário: ${answer['token']}');
        },
      );
      
      //Implementação futura para navegar para a página de perfil após login
      Navigator.of(context).pushReplacementNamed('/profile');
    }
  }

  Future<http.Response> loginUserAPI(String email, String password) {
    return http.post(
      Uri.parse(request),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
  }

  void logout(User user, BuildContext context) {
    user.setEmail("");
    user.setPassword("");
    Navigator.of(context).pushReplacementNamed('/');
  }
}
