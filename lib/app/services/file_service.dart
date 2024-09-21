import 'dart:async';
import 'dart:html' as html;

class FileService {
  void saveFile(String fileName, String content) {
    final blob = html.Blob([content], 'text/plain', 'native');

    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  void printFile() {
    html.window.print();
  }

  Future<String?> openFile() async {
    Completer<String?> completer = Completer();
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = '.txt'; 
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files!.isNotEmpty) {
        final file = files[0];
        final reader = html.FileReader();

       
        reader.readAsText(file);
        reader.onLoadEnd.listen((e) {
          completer.complete(reader.result as String);
        });
      } else {
        completer.complete(null);
      }
    });

    return completer.future;
  }
}
