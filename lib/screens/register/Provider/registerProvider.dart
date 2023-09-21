import 'package:bzsmart/screens/register/Provider/registerState.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterState state = RegisterState();

  void init(){
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImage');
    if (imagePath != null) {
      state.image = File(imagePath);
      state.hasImage = true;
    }
    notifyListeners();
  }

  Future<void> saveImageToPrefs(File image) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await image.copy(tempPath);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', tempPath);
  }

  Future<void> getImage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    final image = File(myfile!.path);
    state.image = image;
    state.hasImage = true;
    notifyListeners();
  }

  // edit profile ______________________________
  Future<void> getImageFromGallery(image) async {
    final myfile = await state.imagePicker.pickImage(source: ImageSource.gallery);
    image = File(myfile!.path);
    dynamic newImage = image;
    saveImageToSharedPreferences(newImage);
    notifyListeners();
  }

  Future<void> saveImageToSharedPreferences(image) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/image.jpg';

    try {
      await image.copy(imagePath);
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString('imagePath', imagePath);

      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

}
