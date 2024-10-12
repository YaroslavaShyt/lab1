import 'package:flutter/material.dart';
import 'package:lab1/app/common/widgets/form_text_field.dart';
import 'package:lab1/app/common/widgets/main_button.dart';
import 'package:lab1/app/screens/home/home_view_model.dart';
import 'package:lab1/app/screens/home/widgets/checkbox/check_box_row.dart';
import 'package:lab1/app/screens/home/widgets/checkbox/triple_check_box_row.dart';

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
          onChangedSecond: viewModel.onSecondCheckBoxChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton(
                value: viewModel.selectedLangValue,
                items: const [
                  DropdownMenuItem(
                    value: "Українська",
                    child: Text("Українська"),
                  ),
                  DropdownMenuItem(
                    value: "English",
                    child: Text("English"),
                  ),
                ],
                onChanged: viewModel.onLanguageDropdownChange),
            DropdownButton(
                value: viewModel.selectedTypeValue,
                items: const [
                  DropdownMenuItem(
                    value: "Цезарь",
                    child: Text("Цезарь"),
                  ),
                  DropdownMenuItem(
                    value: "Тритеміус",
                    child: Text("Тритеміус"),
                  ),
                   DropdownMenuItem(
                    value: "Книжковий",
                    child: Text("Книжковий"),
                  ),
                ],
                onChanged: viewModel.onTypeDropdownChange),
          ],
        ),
        const SizedBox(height: 30),
        TripleCheckBoxRow(
          isCheckedFirst: viewModel.is2DKey,
          isCheckedSecond: viewModel.is3DKey,
          isCheckedThird: viewModel.isKeyword,
          onChangedFirst: viewModel.on2DKeyCheckBoxChanged,
          onChangedSecond: viewModel.on3DKeyCheckBoxChanged,
          onChangedThird: viewModel.onKeywordCheckBoxChanged,
        ),
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
