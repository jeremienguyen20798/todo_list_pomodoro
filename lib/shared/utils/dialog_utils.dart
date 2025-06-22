import 'package:flutter/material.dart';
import 'package:todo_list_pomodoro/shared/widgets/dialog/confirm_dialog.dart';

class DialogUtils {
  static void showConfirmDialog(
      BuildContext context, String confirmMessage, Function() onConfirm) {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            ConfirmDialog(message: confirmMessage)).then((value) {
      if (value != null && value) {
        onConfirm();
      }
    });
  }
}
