import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  double lineHeight;
  double opacityValue;
  final String displayText;
  double? size;
  SmallText({
    Key? key,
    this.opacityValue = 0.5,
    this.color = const Color(0xFF89dad0),
    required this.displayText,
    this.size = 15.0,
    this.lineHeight = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityValue,
      child: Text(displayText,
          style: GoogleFonts.roboto(
            color: color,
            fontSize: size,
            height: lineHeight,
          )),
    );
  }
}
