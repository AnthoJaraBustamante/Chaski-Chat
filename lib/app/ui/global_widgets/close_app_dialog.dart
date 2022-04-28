import 'package:flutter/material.dart';

Future<bool?> closeApp(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('You are about to exit the app.'),
      actions: <Widget>[
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ],
    ),
  );
}
