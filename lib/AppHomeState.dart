import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class AppHomeState with ChangeNotifier, DiagnosticableTreeMixin {
  File? image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  Future<void> openImagePickerGallery() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  Future<File> getImagen() async {
    return image!;
  }
}
