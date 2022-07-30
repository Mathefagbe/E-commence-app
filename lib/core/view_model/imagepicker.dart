import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Images extends ChangeNotifier {
  final storage = FirebaseStorage.instance.ref();
  File? get fileimage => _images;
  File? _images;

  pickedImage() async {
    // creating an instance for the image picker

    ImagePicker _imagePicker = ImagePicker();
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      //convert the image to file then pass to image

      _images = File(image.path);
      // File filepath = File(image.path);
      // // print(_images.toString());
      // // final appDocDir = await getApplicationDocumentsDirectory();
      // // final filePath = "${appDocDir.absolute}${image.path}";
      // // print(filePath);
      // // final file = File(filePath);
      // final storeref = storage.child("images").putFile(filepath);
      // storeref.snapshotEvents.listen(
      //   (event) {
      //     if (TaskState.success == event.state) {
      //       print("complted");
      //     } else if (TaskState.error == event.state) {
      //       print("error");
      //     }
      //   },
      // );
      notifyListeners();
    }
  }
}
