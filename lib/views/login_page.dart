import 'package:user_control/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:user_control/components/form_text_field.dart';
import 'package:user_control/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/avatar.png',
            width: 150,
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            labelText: 'E-mail',
            hintText: 'exemplo@exemplo.com',
            type: TextInputType.emailAddress,
            obscureText: false,
            textController: emailController,
          ),
          FormTextField(
            labelText: 'Senha',
            hintText: '********',
            obscureText: true,
            textController: passwordController,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() {
                isLoading = true;
              });

              LoginController.instance.login(
                  emailController.text, passwordController.text, context);

              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                isLoading = false;
              });
            },
            child: isLoading ? const CircularProgressIndicator(color: Colors.white,) :  const Text(
              "Entrar",
              style: TextStyle(fontSize: 18),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightGreen),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(15)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/create');
            },
            child: Text('Clique aqui para se cadastrar'),
          ),
        ],
      ),
    );
  }
}
