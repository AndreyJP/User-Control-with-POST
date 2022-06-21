import 'package:flutter/material.dart';
import 'package:user_control/components/form_text_field.dart';
import 'package:user_control/components/app_bar.dart';
import 'package:user_control/controllers/user_controller.dart';
import 'package:user_control/models/user.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User user = User();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/add_user.png',
            width: 150,
          ),
          const Text(
            'Cadastrar usuário',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              fontFamily: 'Helvetica',
              color: Colors.lightGreen,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            labelText: 'Usuário',
            hintText: 'Nome do usuário',
            type: TextInputType.emailAddress,
            obscureText: false,
            textController: usernameController,
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

              user.setUsername(usernameController.text);
              user.setEmail(emailController.text);
              user.setPassword(passwordController.text);

              UserController.instance.createUser(user, context);
              
              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                isLoading = false;
              });

            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightGreen),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(15)),
            ),
            child: isLoading ? const CircularProgressIndicator(color: Colors.white,) :  const Text(
              "Cadastrar",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //LoadingAnimationWidget.threeArchedCircle(color: Colors.black, size: 100),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: Text('Voltar para tela de login'),
          ),
        ],
      ),
    );
  }
}
