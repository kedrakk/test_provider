import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadProvider with ChangeNotifier{
  File? _userImage;
  File? get userImage=>_userImage;
  final ImagePicker _picker = ImagePicker();

  setUserImage()async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile!=null){
      _userImage=File(pickedFile.path);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    debugPrint("Bye Bye Image Upload");
    super.dispose();
  }
}