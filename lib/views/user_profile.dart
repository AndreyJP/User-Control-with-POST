import 'package:user_control/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:user_control/components/form_text_field.dart';
import 'package:user_control/controllers/login_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/avatar.png',
                width: 150,
              ),
            ],
          )
        ],
      ),
    );
  }
}
