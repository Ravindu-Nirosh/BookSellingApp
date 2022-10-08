import 'package:booksellapp/utils/appcolor.dart';
import 'package:booksellapp/widgets/MainText.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../utils/dimentions.dart';
import '../widgets/iconandtext.dart';
import '../widgets/small_text.dart';

class BookItemsPages extends StatefulWidget {
  const BookItemsPages({Key? key}) : super(key: key);

  @override
  State<BookItemsPages> createState() => _BookItemsPagesState();
}

class _BookItemsPagesState extends State<BookItemsPages> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimentions.pageCardContainer,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItems(position);
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            color: AppColor.mainIconBgColor,
            activeColor: AppColor.dotActiveColor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        //Popular text
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MainTexts(
                displayText: 'Populer',
              ),
              SizedBox(
                width: 20,
              ),
              SmallText(
                displayText: 'Food Selction',
                color: Colors.grey,
                size: 13,
              ),
            ],
          ),
        ),
        //Food Item List
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (
              context,
              index,
            ) {
              return Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    //Image Section
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/cardImage1.jpg"),
                        ),
                      ),
                    ),
                    //Text And Icon Section
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainTexts(
                              displayText: 'Nutritions Frout Meal Hellow',
                              overFlow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SmallText(
                              displayText: 'Food Description',
                              opacityValue: 0.5,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                  text: 'Normal',
                                  color: AppColor.smallTextColor,
                                  icon: Icons.circle,
                                  iconColor: AppColor.iconColor1,
                                ),
                                IconAndTextWidget(
                                  text: 'Normal',
                                  color: AppColor.smallTextColor,
                                  icon: Icons.location_pin,
                                  iconColor: AppColor.iconColor2,
                                ),
                                IconAndTextWidget(
                                  text: 'Normal',
                                  color: AppColor.smallTextColor,
                                  icon: Icons.location_city,
                                  iconColor: AppColor.iconColor1,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItems(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var curScale = _scaleFactor;

      var currTrans = _height * (1 - curScale) / 2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    print(737.4545454545455 / 20);
    print("Height 2 " + Dimentions.screenHeight.toString());

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimentions.scrollPageImageContainer,
            margin: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimentions.radius30),
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
              height: Dimentions.scrollPageInfoContainer,
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius20),
                color: const Color(0xff1e2023),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTexts(displayText: 'Display Text'),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
