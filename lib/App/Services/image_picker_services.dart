import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'package:image_picker/image_picker.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';

class ImagePickerService extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final showToast = ShowToast();

  // Store selected image
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString imageUrl = "".obs;

  Future<void> pickImageFromGallery(BuildContext context) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        String? uploadedImageUrl = await uploadImageToFirebase(pickedFile);
        print(uploadedImageUrl);
        if (uploadedImageUrl != null) {
          imageUrl.value = uploadedImageUrl;
        } else {
          showToast.showTopToast("Image upload failed");
        }
      } else {
        showToast.showTopToast("No image selected");
      }
    } catch (e) {
      showToast.showTopToast("Failed Upload: $e");
    }
  }

  Future<String?> uploadImageToFirebase(XFile imageFile) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      if (kIsWeb) {
        if (imageFile is XFile) {
          final htmlFile =
              html.File([await imageFile.readAsBytes()], imageFile.name);
          final reader = html.FileReader();
          reader.readAsArrayBuffer(htmlFile);
          await reader.onLoadEnd.first;
          final byteData = reader.result as Uint8List;
          final uploadTask =
              storageRef.putData(byteData); // Upload the byte data
          TaskSnapshot snapshot = await uploadTask;
          String downloadUrl = await snapshot.ref.getDownloadURL();
          return downloadUrl;
        } else {
          print("Error: Expected XFile on Web platform");
          return null;
        }
      } else {
        final file = File(imageFile.path);
        final uploadTask = storageRef.putFile(file);
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      }
    } on FirebaseException catch (e) {
      print("Firebase error: ${e.message}");
    } catch (e) {
      print("Error uploading image: $e");
    }
    return null;
  }
}
