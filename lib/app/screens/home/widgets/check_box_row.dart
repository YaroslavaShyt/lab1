import 'package:flutter/material.dart';

class CheckBoxRow extends StatelessWidget {
  const CheckBoxRow({
    required this.isCheckedFirst,
    required this.isCheckedSecond,
    required this.onChangedFirst,
    required this.onChangedSecond,
    super.key,
  });

  final bool isCheckedFirst;
  final bool isCheckedSecond;

  final void Function(bool?) onChangedFirst;
  final void Function(bool?) onChangedSecond;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Colors.green,
          value: isCheckedFirst,
          onChanged: onChangedFirst,
        ),
        const Text("Encrypt"),
        Checkbox(
          activeColor: Colors.green,
          value: isCheckedSecond,
          onChanged: onChangedSecond,
        ),
        const Text("Decrypt"),
      ],
    );
  }
}
