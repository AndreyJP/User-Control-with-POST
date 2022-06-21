import 'package:flutter/material.dart';

AlertDialog alert(BuildContext context, String title, String description) {
  return AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context, 'OK'),
        child: const Text('OK'),
      ),
    ],
  );
}
