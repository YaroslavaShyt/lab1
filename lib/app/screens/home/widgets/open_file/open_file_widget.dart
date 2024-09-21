import 'package:flutter/material.dart';
import 'package:lab1/app/screens/home/home_view_model.dart';
import 'package:lab1/app/screens/home/widgets/border_button.dart';
import 'package:lab1/app/screens/home/widgets/continue_row.dart';

class OpenFileWidget extends StatelessWidget {
  const OpenFileWidget({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Open",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          BorderButton(
              height: 150,
              width: 500,
              title: "Click to open a file",
              icon: Icons.file_open_rounded,
              color: Colors.white,
              borderColor: Colors.green,
              onTap: viewModel.onOpenFile),
          const SizedBox(
            height: 20,
          ),
          if (viewModel.data.isNotEmpty) ...[
            SizedBox(
              width: 500,
              child: Wrap(
                children: [Text(viewModel.data)],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
          ContinueRow(viewModel: viewModel),
        ],
      ),
    );
  }
}
