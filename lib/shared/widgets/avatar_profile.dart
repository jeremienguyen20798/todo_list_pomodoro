import 'package:flutter/material.dart';
import 'package:todo_list_pomodoro/shared/constants/color_constants.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: ColorConstants.avatarBackgroundColor),
      child: Icon(Icons.account_circle,
          color: ColorConstants.iconColor, size: 48.0),
    );
  }
}
