import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      ListTile(title: Text("Menu A")),
                      ListTile(title: Text("Menu B")),
                      ListTile(title: Text("Menu C")),
                      ListTile(title: Text("Menu D")),
                      ListTile(title: Text("Menu E")),
                      ListTile(title: Text("Menu F")),
                      ListTile(title: Text("Menu G")),
                      ListTile(title: Text("Menu H")),
                      ListTile(title: Text("Menu I")),
                      ListTile(title: Text("Menu J")),
                      ListTile(title: Text("Menu K")),
                      ListTile(title: Text("Menu L")),
                      ListTile(title: Text("Menu M")),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(child: Text('Content')),
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoHomePage extends StatefulWidget {
  @override
  _CryptoHomePageState createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  String filePath = '';
  String key = '';
  String inputText = '';
  String resultText = '';
  String selectedLanguage = 'English';
  String developerInfo = 'Developed by [Your Name]';

  void encrypt() {
    setState(() {
      // Implement Caesar cipher encryption logic here
      resultText = 'Encrypted: ' + inputText; // Placeholder
    });
  }

  void decrypt() {
    setState(() {
      // Implement Caesar cipher decryption logic here
      resultText = 'Decrypted: ' + inputText; // Placeholder
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symmetric Cryptography System'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Create New File'),
              onTap: () {
                // Implement file creation logic
              },
            ),
            ListTile(
              title: Text('Open File'),
              onTap: () {
                // Implement file opening logic
              },
            ),
            ListTile(
              title: Text('Save File'),
              onTap: () {
                // Implement file saving logic
              },
            ),
            ListTile(
              title: Text('Print File'),
              onTap: () {
                // Implement file printing logic
              },
            ),
            ListTile(
              title: Text('Developer Info'),
              onTap: () {
                // Display developer info
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(developerInfo),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text('Exit'),
              onTap: () {
                // Close the app
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: <String>['English', 'Ukrainian']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Key'),
              onChanged: (value) {
                key = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Input Text'),
              onChanged: (value) {
                inputText = value;
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: encrypt,
                  child: Text('Encrypt'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: decrypt,
                  child: Text('Decrypt'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Result: $resultText'),
          ],
        ),
      ),
    );
  }
}
