import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabbit_converter/rabbit_converter.dart';
import 'package:test_providers/main.dart';

class FontTestPage extends StatelessWidget {
  const FontTestPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(isUnicode.toString());
    String text=!isUnicode?"ဒါကေႏြရာသီပါ။":Rabbit.zg2uni("ဒါကေႏြရာသီပါ။");
    return Scaffold(
      appBar: AppBar(title: const Text("Font Test Page"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("This is the summer",style: GoogleFonts.roboto(fontSize: 16),),
        Text(text,style: GoogleFonts.roboto(fontSize: 16),),
      ],),
    );
  }
}