import 'package:flutter/material.dart';

final class SnackbarUtils {
  static void showMessage(BuildContext context, String? message) {
    if (message == null) {
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
