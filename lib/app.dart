import 'package:flutter/material.dart';
import 'package:todo_list_pomodoro/features/home/view/home_page.dart';
import 'package:todo_list_pomodoro/shared/constants/color_constants.dart';

import 'shared/constants/app_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorConstants.seedAppColor),
            focusColor: ColorConstants.whiteColor,
            hoverColor: ColorConstants.whiteColor,
            highlightColor: ColorConstants.whiteColor,
            splashColor: ColorConstants.whiteColor,
            useMaterial3: true),
        home: const HomePage());
  }
}
