import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function() onButtonPressed;
  final String text;
  const MainButton({
    super.key,
    required this.onButtonPressed,
    this.text = "Login",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
