import 'package:booksellapp/utils/appcolor.dart';
import 'package:booksellapp/widgets/MainText.dart';
import 'package:flutter/material.dart';

import '../widgets/iconandtext.dart';
import '../widgets/small_text.dart';

class BookItemsPages extends StatefulWidget {
  const BookItemsPages({Key? key}) : super(key: key);

  @override
  State<BookItemsPages> createState() => _BookItemsPagesState();
}

class _BookItemsPagesState extends State<BookItemsPages> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItems(position);
        },
      ),
    );
  }

  Widget _buildPageItems(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven
                ? const Color(0xFF69c5df)
                : const Color(0xff9294cc),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/cardImage1.jpg"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff1e2023),
            ),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTexts(displayText: 'Display Text'),
                  const SizedBox(
                    height: 15,
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
                      const SizedBox(
                        width: 10,
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: SmallText(
                          displayText: '4.5',
                          color: Colors.grey,
                          size: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: SmallText(
                          displayText: '1234',
                          color: Colors.grey,
                          size: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      IconAndTextWidget(
                        text: 'Normal',
                        color: AppColor.smallTextColor,
                        icon: Icons.circle,
                        iconColor: AppColor.mainIconBgColor,
                      ),
                      IconAndTextWidget(
                        text: '1.5km',
                        color: AppColor.smallTextColor,
                        icon: Icons.location_pin,
                        iconColor: AppColor.mainIconBgColor,
                      ),
                      IconAndTextWidget(
                        text: 'Normal',
                        color: AppColor.smallTextColor,
                        icon: Icons.location_city,
                        iconColor: AppColor.mainIconBgColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
