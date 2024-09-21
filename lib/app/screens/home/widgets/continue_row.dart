import 'package:flutter/material.dart';
import 'package:lab1/app/common/widgets/form_text_field.dart';
import 'package:lab1/app/common/widgets/main_button.dart';
import 'package:lab1/app/screens/home/home_view_model.dart';
import 'package:lab1/app/screens/home/widgets/check_box_row.dart';

class ContinueRow extends StatelessWidget {
  const ContinueRow({required this.viewModel, super.key});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormTextField(label: 'Key', onChanged: viewModel.onKeyChanges),
        CheckBoxRow(
            isCheckedFirst: viewModel.isCheckedFirst,
            isCheckedSecond: viewModel.isCheckedSecond,
            onChangedFirst: viewModel.onFirstCheckBoxChanged,
            onChangedSecond: viewModel.onSecondCheckBoxChanged),
        DropdownButton(
            value: viewModel.selectedValue,
            items: const [
              DropdownMenuItem(child: Text("Українська"), value: "Українська"),
              DropdownMenuItem(child: Text("English"), value: "English"),
            ],
            onChanged: viewModel.onDropdownChange),
        const SizedBox(height: 30),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 300,
            child: MainButton(
              onButtonPressed: () => viewModel.onCreateFileNextPressed(
                () => _onSuccess(context),
                () => _onFailure(context),
              ),
              text: "Next",
            ),
          ),
        ),
      ],
    );
  }

  void _onSuccess(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.green,
            ),
            title: const Text("Result"),
            content: SizedBox(
              height: 60,
              child: Wrap(
                children: [
                  Text(viewModel.resultData!),
                ],
              ),
            ),
            actions: [
              Center(
                child: Row(
                  children: [
                    TextButton(
                      onPressed: viewModel.onPrintPressed,
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.green.shade100),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: const Text('Print'),
                    ),
                    TextButton(
                      onPressed: viewModel.onSavePressed,
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.green.shade100),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  void _onFailure(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(
              Icons.cancel_rounded,
              color: Colors.red,
            ),
            title: const Text("Failure"),
            content: const SizedBox(
              height: 60,
              child: Wrap(
                children: [
                  Text("Could not perform operation"),
                ],
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: viewModel.onOKPressed,
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(Colors.green.shade100),
                    foregroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text('OK'),
                ),
              ),
            ],
          );
        });
  }
}
