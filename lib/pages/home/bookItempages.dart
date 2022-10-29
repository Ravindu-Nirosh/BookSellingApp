import 'package:booksellapp/Routes/RouteHelper.dart';
import 'package:booksellapp/controllers/Recommended_product_controller.dart';
import 'package:booksellapp/controllers/populer_product_controller.dart';
import 'package:booksellapp/models/product_models.dart';
import 'package:booksellapp/utils/appcolor.dart';
import 'package:booksellapp/widgets/MainText.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../widgets/app_icon_text_rating_column.dart';
import '/../utils/dimentions.dart';
import '/../widgets/iconandtext.dart';
import '/../widgets/small_text.dart';

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
        GetBuilder<PopulerProductController>(builder: (PopulerProducts) {
          return PopulerProducts.isLoaded
              ? Container(
                  height: Dimentions.pageCardContainer,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: PopulerProducts.populerProductList.length,
                    itemBuilder: (context, position) {
                      return _buildPageItems(position,
                          PopulerProducts.populerProductList[position]);
                    },
                  ),
                )
              : Container(
                  width: 50,
                  height: 50,
                  child: const LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: const [Colors.cyan],
                  ),
                );
        }),
        SizedBox(
          height: Dimentions.height10,
        ),
        GetBuilder<PopulerProductController>(builder: (PopulerProducts) {
          return DotsIndicator(
            dotsCount: PopulerProducts.populerProductList.isEmpty
                ? 1
                : PopulerProducts.populerProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              color: AppColor.mainIconBgColor,
              activeColor: AppColor.dotActiveColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        SizedBox(
          height: Dimentions.height30,
        ),
        //Popular text
        Container(
          margin: EdgeInsets.only(left: Dimentions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MainTexts(
                displayText: 'Recommended Product',
              ),
              SizedBox(
                width: Dimentions.width20,
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
        GetBuilder<RecommendedProductController>(builder: (recomendProduct) {
          return recomendProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recomendProduct.recomendProductList.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendeFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimentions.width30,
                            right: Dimentions.width30),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: Dimentions.height5,
                                  bottom: Dimentions.height5),
                              width: Dimentions.width120,
                              height: Dimentions.height120,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.circular(Dimentions.radius30),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "http://mvs.bslmeiyu.com/uploads/${recomendProduct.recomendProductList[index].img!}"),
                                ),
                              ),
                            ),
                            //Text And Icon Section
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: Dimentions.width20,
                                    top: Dimentions.height5),
                                height: Dimentions.height100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainTexts(
                                      displayText: recomendProduct
                                          .recomendProductList[index].name,
                                      overFlow: TextOverflow.ellipsis,
                                      size: Dimentions.font20,
                                    ),
                                    SizedBox(
                                      height: Dimentions.height10,
                                    ),
                                    SmallText(
                                      displayText: 'Food Description',
                                      opacityValue: 0.5,
                                      color: Colors.grey,
                                      size: Dimentions.font15,
                                    ),
                                    SizedBox(
                                      height: Dimentions.height15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
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
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: Colors.red,
                );
        }),
      ],
    );
  }

  Widget _buildPageItems(int index, ProductModel populerProduct) {
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
    print("Height 2 ${Dimentions.screenHeight}");

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getPopulerFood(index));
        },
        child: Stack(
          children: [
            Container(
              height: Dimentions.scrollPageImageContainer,
              margin: EdgeInsets.only(
                left: Dimentions.width5,
                right: Dimentions.width5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimentions.radius30),
                color: index.isEven
                    ? const Color(0xFF69c5df)
                    : const Color(0xff9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "http://mvs.bslmeiyu.com/uploads/${populerProduct.img!}"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimentions.scrollPageInfoContainer,
                margin: EdgeInsets.only(
                  left: Dimentions.width30,
                  right: Dimentions.width30,
                  bottom: Dimentions.height10,
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
                  padding: EdgeInsets.all(Dimentions.height15),
                  child: AppColumn(
                    text: populerProduct.name!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
