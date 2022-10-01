import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String displayText;
  double? size;
  SmallText({
    Key? key,
    this.color = const Color(0xFF89dad0),
    required this.displayText,
    this.size = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(displayText,
        style: GoogleFonts.roboto(
          color: color,
          fontSize: size,
        ));
  }
}
