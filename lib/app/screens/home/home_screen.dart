import 'package:flutter/material.dart';
import 'package:lab1/app/common/widgets/form_text_field.dart';
import 'package:lab1/app/screens/home/home_view_model.dart';
import 'package:lab1/app/screens/home/widgets/border_button.dart';
import 'package:lab1/app/screens/home/widgets/drawer/main_drawer.dart';
import 'package:lab1/app/screens/home/widgets/main_greed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.viewModel,
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Symmetric Cryptography System',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade300,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: _buildDrawer(context),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGreed(),
              if (viewModel.isCreateFileSelected) _buildCreateFile(),
              if (viewModel.isOpenFileSelected) _buildOpenFile(),
            ],
          )),
    );
  }

  void _onDeveloperInfoPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.developer_mode,
            color: Colors.green,
          ),
          title: const Text("Developed by"),
          content: SizedBox(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Surname: ${viewModel.userData.surname}"),
                Text("Name: ${viewModel.userData.name}"),
                Text("Group: ${viewModel.userData.group}"),
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
      },
    );
  }

  Widget _buildGreed() {
    return SizedBox(
        width: 450,
        child: MainGreed(
          onNewFilePressed: viewModel.onCreateFilePressed,
          onOpenFilePressed: viewModel.onOpenFilePressed,
        ));
  }

  Widget _buildDrawer(context) {
    return MainDrawer(
      onCreateFilePressed: () {},
      onDeveloperInfoPressed: () => _onDeveloperInfoPressed(context),
      onLogoutPressed: viewModel.onLogoutPressed,
      onOpenFilePressed: () {},
    );
  }

  Widget _buildOpenFile() {
    return Column(
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
            height: 100,
            width: 400,
            title: "Click to open a file",
            icon: Icons.file_open_rounded,
            color: Colors.white,
            borderColor: Colors.green,
            onTap: () {}),
      ],
    );
  }

  Widget _buildCreateFile() {
    return SizedBox(
      height: 500,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          FormTextField(
            label: "File name",
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Enter data",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FormTextField(
                maxLines: 10,
                label: "",
                onChanged: (value) {},
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
