import 'package:flutter/material.dart';

enum ToastType {
  success,
  error,
  warning,
  info,
}

class Toast {

  static void show(BuildContext context, String message, {ToastType type = ToastType.info}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        backgroundColor: type == ToastType.success ? Colors.green : type == ToastType.error ? Colors.red : type == ToastType.warning ? Colors.orange : const Color.fromARGB(255, 8, 61, 119),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}