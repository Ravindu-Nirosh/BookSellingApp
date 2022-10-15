import 'package:booksellapp/widgets/iconandtext.dart';
import 'package:booksellapp/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../utils/appcolor.dart';
import '../utils/dimentions.dart';
import 'MainText.dart';

class AppColumn extends StatelessWidget {
  final String text;
  double? size_big;
  AppColumn({Key? key, required this.text, this.size_big}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTexts(
          displayText: text,
          size: Dimentions.font20,
        ),
        SizedBox(
          height: Dimentions.sizeBoxed15,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        size: 15,
                        color: AppColor.mainIconBgColor,
                      )),
            ),
            SizedBox(
              width: Dimentions.width10,
            ),
            Opacity(
              opacity: 0.5,
              child: SmallText(
                displayText: '4.5',
                color: Colors.grey,
                size: 12,
              ),
            ),
            SizedBox(
              width: Dimentions.width10,
            ),
            Opacity(
              opacity: 0.5,
              child: SmallText(
                displayText: '1234',
                color: Colors.grey,
                size: 12,
              ),
            ),
            SizedBox(
              width: Dimentions.width10,
            ),
            Opacity(
              opacity: 0.5,
              child: SmallText(
                displayText: 'Comments',
                color: Colors.grey,
                size: 12,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimentions.sizeBoxed15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndTextWidget(
              text: 'Normal',
              color: AppColor.smallTextColor,
              icon: Icons.circle,
              iconColor: AppColor.iconColor1,
            ),
            IconAndTextWidget(
              text: '1.5km',
              color: AppColor.smallTextColor,
              icon: Icons.location_pin,
              iconColor: AppColor.iconColor2,
            ),
            IconAndTextWidget(
              text: 'Normal',
              color: AppColor.smallTextColor,
              icon: Icons.location_city,
              iconColor: AppColor.iconColor3,
            ),
          ],
        ),
      ],
    );
  }
}
