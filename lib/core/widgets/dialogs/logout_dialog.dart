import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutDialog {
  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sair do aplicativo'),
          content:
              const Text('Você tem certeza de que deseja sair do aplicativo?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}
