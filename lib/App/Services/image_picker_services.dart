import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';

class ImagePickerService extends GetxController {
  final ImagePicker picker = ImagePicker();
  final showToast = ShowToast();

  // Store selected image
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImageFromGallery(BuildContext context) async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      } else {
        showToast.showTopToast("No image selected");
      }
    } catch (e) {
      showToast.showTopToast("Failed Upload: $e");
    }
  }

}
