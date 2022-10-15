import 'package:booksellapp/utils/dimentions.dart';
import 'package:booksellapp/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimentions.screenHeight / 6.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(displayText: firstHalf)
          : Column(
              children: [
                SmallText(
                  displayText:
                      hiddenText ? ('$firstHalf...') : (firstHalf + secondHalf),
                  color: Colors.white54,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (hiddenText == true) {
                        hiddenText = false;
                      } else {
                        hiddenText = true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      hiddenText
                          ? SmallText(
                              displayText: 'Show More',
                              color: Colors.white54,
                            )
                          : SmallText(
                              displayText: 'Show less',
                              color: Colors.white54,
                            ),
                      hiddenText
                          ? const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.white54,
                            )
                          : const Icon(
                              Icons.arrow_drop_up_outlined,
                              color: Colors.white54,
                            ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
