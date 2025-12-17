import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier with WidgetsBindingObserver {
  final ImagePicker _picker = ImagePicker();
  File? imagePath;

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = File(pickedFile.path);
    }
    notifyListeners();
  }
}
