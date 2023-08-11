import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text_custome extends StatelessWidget {

  String text;
  Color? color;
  double size;
  FontWeight fontWeight;

  text_custome({required this.text, this.color, required this.size, required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.lexend(textStyle: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    )),);
  }
}