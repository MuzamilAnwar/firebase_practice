import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Selectimage {
  static File? imagefile;
  static Future pickimage() async {
    final picker = ImagePicker();
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedfile != null) {
      imagefile = File(pickedfile.path);
    }
  }
}
