import 'package:flutter/material.dart';
import 'package:lab1/app/screens/home/widgets/drawer/main_drawer_header.dart';
import 'package:lab1/app/screens/home/widgets/drawer/main_drawer_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onCreateFilePressed,
    required this.onOpenFilePressed,
    required this.onLogoutPressed,
    required this.onDeveloperInfoPressed,
  });

  final VoidCallback onCreateFilePressed;
  final VoidCallback onOpenFilePressed;
  final VoidCallback onLogoutPressed;
  final VoidCallback onDeveloperInfoPressed;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const MainDrawerHeader(),
          MainDrawerItem(
            title: "New file",
            icon: Icons.add_box_rounded,
            onPressed: onCreateFilePressed,
          ),
          MainDrawerItem(
            title: "Open file",
            icon: Icons.file_open_rounded,
            onPressed: onOpenFilePressed,
          ),
          MainDrawerItem(
            title: "Developer Info",
            icon: Icons.developer_mode_rounded,
            onPressed: onDeveloperInfoPressed,
          ),
          MainDrawerItem(
            title: "Exit",
            icon: Icons.exit_to_app_rounded,
            onPressed: onLogoutPressed,
          ),
        ],
      ),
    );
  }
}
