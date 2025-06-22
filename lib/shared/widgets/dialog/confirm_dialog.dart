import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class ConfirmDialog extends StatelessWidget {
  final String message;
  final String? confirm;
  final String? cancel;

  const ConfirmDialog(
      {super.key, required this.message, this.confirm, this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(confirm ?? AppConstants.confirm),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(cancel ?? AppConstants.cancel),
        ),
      ],
    );
  }
}
