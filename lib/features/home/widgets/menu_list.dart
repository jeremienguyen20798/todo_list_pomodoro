import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/color_constants.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 8.0,
          leading: Icon(Icons.wb_sunny, color: ColorConstants.todayColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: const Text('Hôm nay', style: TextStyle(fontSize: 14.0)),
          trailing: Text('0m 2',
              style: TextStyle(fontSize: 14.0, color: ColorConstants.grey400)),
        ),
        ListTile(
          horizontalTitleGap: 8.0,
          leading: Icon(Icons.tsunami, color: ColorConstants.tomorrowColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: const Text('Ngày mai', style: TextStyle(fontSize: 14.0)),
          trailing: Text('0m 0',
              style: TextStyle(fontSize: 14.0, color: ColorConstants.grey400)),
        ),
        ListTile(
          horizontalTitleGap: 8.0,
          leading: Icon(Icons.event, color: ColorConstants.seedAppColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: const Text('Tuần này', style: TextStyle(fontSize: 14.0)),
          trailing: Text('5h 6',
              style: TextStyle(fontSize: 14.0, color: ColorConstants.grey400)),
        ),
        ListTile(
          horizontalTitleGap: 8.0,
          leading:
              Icon(Icons.event_available, color: ColorConstants.plannedColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title:
              const Text('Đã lên kế hoạch', style: TextStyle(fontSize: 14.0)),
          trailing: Text('5h 6',
              style: TextStyle(fontSize: 14.0, color: ColorConstants.grey400)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ExpandablePanel(
              header: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 8.0,
                leading: Icon(Icons.feed, color: ColorConstants.taskColor),
                title: const Text('Nhiệm vụ', style: TextStyle(fontSize: 14.0)),
              ),
              collapsed: const SizedBox(),
              expanded: Column(
                children: [
                  ListTile(
                    horizontalTitleGap: 8.0,
                    leading: const Icon(Icons.edit),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Text('Đang thực hiện',
                        style: TextStyle(fontSize: 14.0)),
                    trailing: Text('5h 6',
                        style: TextStyle(
                            fontSize: 14.0, color: ColorConstants.grey400)),
                  ),
                  ListTile(
                    horizontalTitleGap: 8.0,
                    leading: Icon(Icons.check_circle_outline,
                        color: ColorConstants.completeColor),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    title: const Text('Hoàn thành',
                        style: TextStyle(fontSize: 14.0)),
                    trailing: Text('5h 6',
                        style: TextStyle(
                            fontSize: 14.0, color: ColorConstants.grey400)),
                  ),
                  ListTile(
                    horizontalTitleGap: 8.0,
                    leading: Icon(Icons.cancel_rounded,
                        color: ColorConstants.cancelColor),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    title:
                        const Text('Đã huỷ', style: TextStyle(fontSize: 14.0)),
                    trailing: Text('6',
                        style: TextStyle(
                            fontSize: 14.0, color: ColorConstants.grey400)),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
