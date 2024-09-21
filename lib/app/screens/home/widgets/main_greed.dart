import 'package:flutter/material.dart';
import 'package:lab1/app/screens/home/widgets/container_button.dart';

class MainGreed extends StatelessWidget {
  const MainGreed({
    required this.onNewFilePressed,
    required this.onOpenFilePressed,
    super.key,
  });

  final VoidCallback onNewFilePressed;
  final VoidCallback onOpenFilePressed;

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 220,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsetsDirectional.all(10),
      children: [
        ContainerButton(
          title: "Create a file",
          icon: Icons.add_box_rounded,
          onTap: onNewFilePressed,
        ),
        ContainerButton(
          title: "Open a file",
          icon: Icons.file_open_rounded,
          onTap: onOpenFilePressed,
          color: Colors.green.shade300,
        ),
      ],
    );
  }
}
