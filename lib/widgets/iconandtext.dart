import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Color iconColor;

  const IconAndTextWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.icon,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 15,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
