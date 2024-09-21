import 'package:flutter/material.dart';
import 'package:lab1/app/common/widgets/form_text_field.dart';
import 'package:lab1/app/screens/home/widgets/continue_row.dart';
import 'package:lab1/app/screens/home/home_view_model.dart';

class CreateFileWidget extends StatelessWidget {
  const CreateFileWidget({
    required this.viewModel,
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 20),
          FormTextField(
            label: "File name",
            onChanged: viewModel.onFileNameChanges,
          ),
          const SizedBox(height: 20),
          const Text(
            "Enter data",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: FormTextField(
                maxLines: 8,
                label: "",
                onChanged: viewModel.onDataChanges,
              ),
            ),
          ),
          ContinueRow(viewModel: viewModel),
        ],
      ),
    );
  }
}
