import 'package:flutter/material.dart';
import 'package:todo_list_pomodoro/features/login/view/login_page.dart';
import 'package:todo_list_pomodoro/shared/constants/color_constants.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginPage()));
      },
      child: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstants.avatarBackgroundColor),
        child: const Icon(Icons.account_circle,
            color: ColorConstants.whiteColor, size: 48.0),
      ),
    );
  }
}
