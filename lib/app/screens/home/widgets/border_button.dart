import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.onTap,
  });

  final double height;
  final double width;
  final String title;
  final IconData icon;
  final Color color;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.green,
              size: 30,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
