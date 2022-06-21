import 'package:flutter/material.dart';
import 'package:user_control/views/create_user_page.dart';
import 'package:user_control/views/login_page.dart';
import 'package:user_control/views/user_profile.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/create': (context) => const CreateUser(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}