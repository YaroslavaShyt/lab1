import 'package:flutter/material.dart';
import 'package:lab1/app/screens/home/home_view_model.dart';
import 'package:lab1/app/screens/home/widgets/create_file/create_file_widget.dart';
import 'package:lab1/app/screens/home/widgets/drawer/main_drawer.dart';
import 'package:lab1/app/screens/home/widgets/main_greed.dart';
import 'package:lab1/app/screens/home/widgets/open_file/open_file_widget.dart';

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
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: 450,
                      child: MainGreed(
                        onNewFilePressed: viewModel.onCreateFilePressed,
                        onOpenFilePressed: viewModel.onOpenFilePressed,
                      )),
                  if (viewModel.isCreateFileSelected)
                    CreateFileWidget(viewModel: viewModel),
                  if (viewModel.isOpenFileSelected)
                    OpenFileWidget(viewModel: viewModel),
                ],
              ),
            ),
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

  Widget _buildDrawer(context) {
    return MainDrawer(
      onCreateFilePressed: () {},
      onDeveloperInfoPressed: () => _onDeveloperInfoPressed(context),
      onLogoutPressed: viewModel.onLogoutPressed,
      onOpenFilePressed: () {},
    );
  }
}
