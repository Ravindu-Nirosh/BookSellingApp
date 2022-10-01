import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTexts extends StatelessWidget {
  Color? color;
  final String displayText;
  double? size;
  TextOverflow? overFlow;
  MainTexts(
      {Key? key,
      this.color = const Color(0xFF89dad0),
      required this.displayText,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(displayText,
        maxLines: 1,
        overflow: overFlow,
        style: GoogleFonts.roboto(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size,
        ));
  }
}
