import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType? type;
  final bool? obscureText;
  final TextEditingController? textController;

  const FormTextField(
      {Key? key, @required this.labelText, @required this.hintText, @required this.obscureText, @required this.textController, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        keyboardType: type,
        obscureText: obscureText ?? false,
      ),
    );
  }
}
