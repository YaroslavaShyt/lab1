import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  const ContainerButton({
    required this.title,
    required this.icon,
    required this.onTap,
    this.color = Colors.green,
    this.size = 200,
    super.key,
  });

  final double size;
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
