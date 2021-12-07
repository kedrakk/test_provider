import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_providers/image_provider.dart';

class ImageUploadTestPage extends StatelessWidget {
  const ImageUploadTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload Check"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ImageUploadProvider(),
        builder: (context,_){
          return Consumer<ImageUploadProvider>(
            builder: (context,provider,_){
              if (provider.userImage!=null) {
                return ImageView(
                  imageFile: provider.userImage,
                  onPressed: ()=>provider.setUserImage(),
                );
              } else {
                return Center(
                  child: IconButton(
                    icon: const Icon(Icons.camera),
                    onPressed: ()=>provider.setUserImage(),
                  ),
                );
              }
            }
          );
        },
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.imageFile,required this.onPressed}) : super(key: key);
  final File? imageFile;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onPressed,
        child: Image.file(imageFile!)
      ),
    );
  }
}
