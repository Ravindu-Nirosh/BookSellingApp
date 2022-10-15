import 'package:flutter/material.dart';

class PageIcons extends StatelessWidget {
  final IconData icon;
  final Color iconcolor;
  final double size;
  final Color backgroundColor;

  PageIcons({
    Key? key,
    required this.icon,
    this.iconcolor = const Color(0xff808080),
    this.backgroundColor = const Color(0xFF89dad0),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconcolor,
        size: 16,
      ),
    );
  }
}
