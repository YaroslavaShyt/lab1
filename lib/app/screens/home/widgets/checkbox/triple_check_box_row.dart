import 'package:flutter/material.dart';

class TripleCheckBoxRow extends StatelessWidget {
  const TripleCheckBoxRow({
    required this.isCheckedFirst,
    required this.isCheckedSecond,
    required this.isCheckedThird,
    required this.onChangedFirst,
    required this.onChangedSecond,
    required this.onChangedThird,
    super.key,
  });

  final bool isCheckedFirst;
  final bool isCheckedSecond;
  final bool isCheckedThird;

  final void Function(bool?) onChangedFirst;
  final void Function(bool?) onChangedSecond;
  final void Function(bool?) onChangedThird;

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
        const Text("2D"),
        Checkbox(
          activeColor: Colors.green,
          value: isCheckedSecond,
          onChanged: onChangedSecond,
        ),
        const Text("3D"),
        Checkbox(
          activeColor: Colors.green,
          value: isCheckedThird,
          onChanged: onChangedThird,
        ),
        const Text("Keyword"),
      ],
    );
  }
}
