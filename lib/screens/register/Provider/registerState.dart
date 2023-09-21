import 'dart:io';
import 'package:image_picker/image_picker.dart';


class RegisterState {

  final imagePicker = ImagePicker();
  String country = "England";
  File? galleryImage;
  late File image;
  bool hasImage = false;


}