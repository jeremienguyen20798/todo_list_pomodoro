import 'package:flutter/material.dart';
import 'package:todo_list_pomodoro/features/home/widgets/menu_list.dart';
import 'package:todo_list_pomodoro/shared/constants/color_constants.dart';
import 'package:todo_list_pomodoro/shared/widgets/avatar_profile.dart';

part 'menu_actions_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        title: const AvatarProfile(),
        centerTitle: false,
        automaticallyImplyLeading: false,
        leadingWidth: 0.0,
        actions: menuActions(), 
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [Expanded(child: MenuList())],
      ),
      backgroundColor: ColorConstants.whiteColor,
    );
  }
}
