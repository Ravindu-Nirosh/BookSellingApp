import 'package:booksellapp/pages/home/mainbookpage.dart';
import 'package:booksellapp/utils/app_const.dart';
import 'package:booksellapp/widgets/MainText.dart';
import 'package:booksellapp/widgets/expandable_text_widget.dart';
import 'package:booksellapp/widgets/pageicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/populer_product_controller.dart';
import '../../utils/dimentions.dart';
import '../../widgets/app_icon_text_rating_column.dart';

class PopulerBookPages extends StatelessWidget {
  int pageId;
  PopulerBookPages({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopulerProductController>().populerProductList[pageId];
    Get.find<PopulerProductController>().initPopulerProduct();
    return Scaffold(
      backgroundColor: const Color(0xff1e2023),
      body: Stack(
        children: [
          //Page Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimentions.height350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      AppConst.baseUrl + AppConst.UPLOAD_URL + product.img!),
                ),
              ),
            ),
          ),
          //page Icons front back button
          Positioned(
              top: Dimentions.height30,
              left: Dimentions.width20,
              right: Dimentions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() => {
                          Get.to(() => MainBookPage()),
                        }),
                    child: PageIcons(
                      icon: Icons.arrow_back,
                      backgroundColor: Color(0xff000000),
                    ),
                  ),
                  PageIcons(
                    icon: Icons.shopping_cart,
                    backgroundColor: Color(0xff000000),
                  ),
                ],
              )),
          //Book Deatils
          Positioned(
            top: Dimentions.height320,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(Dimentions.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimentions.height30),
                  topRight: Radius.circular(Dimentions.height30),
                ),
                color: const Color(0xff1e2023),
              ),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name),
                  SizedBox(
                    height: Dimentions.height20,
                  ),
                  MainTexts(
                    displayText: 'Introduction ',
                    size: Dimentions.font18,
                  ),
                  SizedBox(
                    height: Dimentions.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: product.description),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopulerProductController>(
        builder: (populerProduct) {
          return Container(
            padding: EdgeInsets.only(
              top: Dimentions.height5,
              left: Dimentions.width20,
              right: Dimentions.width20,
            ),
            height: Dimentions.height100,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimentions.height30 * 1.3),
                topRight: Radius.circular(Dimentions.height30 * 1.3),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1e2023),
                    borderRadius: BorderRadius.circular(Dimentions.radius15),
                  ),
                  height: Dimentions.height70,
                  padding: EdgeInsets.all(Dimentions.width10),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            populerProduct.setIncrements(false);
                          },
                          child: Icon(Icons.remove)),
                      SizedBox(
                        width: Dimentions.width10,
                      ),
                      MainTexts(
                        displayText: populerProduct.count.toString(),
                        size: Dimentions.height20,
                        color: Colors.white54,
                      ),
                      SizedBox(
                        width: Dimentions.width10,
                      ),
                      GestureDetector(
                        onTap: () {
                          populerProduct.setIncrements(true);
                        },
                        child: Icon(
                          Icons.add,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1e2953),
                    borderRadius: BorderRadius.circular(Dimentions.radius15),
                  ),
                  padding: EdgeInsets.all(Dimentions.height20),
                  height: Dimentions.height70,
                  child: Row(
                    children: [
                      MainTexts(
                        displayText:
                            '\$ ${product.price * populerProduct.count} ',
                        color: Colors.white54,
                        size: Dimentions.height20,
                      ),
                      MainTexts(
                        displayText: 'Add To Cart',
                        color: Colors.white54,
                        size: Dimentions.height20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
