import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function(int)? onClicked;

  const CustomAppBar({super.key, required this.title, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          padding: const EdgeInsets.only(left: 16.0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          color: Colors.black),
      title: Text(title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold)),
      actions: [
        PopupMenuButton<int>(
          icon: const Icon(Icons.more_horiz, color: Colors.grey),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: ListTile(
                leading: Icon(Icons.sync_alt, color: Colors.grey),
                title: Text(
                  'Sắp xếp theo',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const PopupMenuItem(
              value: 2,
              child: ListTile(
                leading: Icon(Icons.list, color: Colors.grey),
                title: Text(
                  'Chỉnh sửa đồng loạt',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
          offset: const Offset(0, 48),
          color: Colors.white,
          elevation: 2,
          onSelected: (value) {
            if (onClicked != null) {
              onClicked!(value);
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}
