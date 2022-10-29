import 'package:booksellapp/Routes/RouteHelper.dart';
import 'package:booksellapp/controllers/Recommended_product_controller.dart';
import 'package:booksellapp/utils/app_const.dart';
import 'package:booksellapp/utils/dimentions.dart';
import 'package:booksellapp/widgets/MainText.dart';
import 'package:booksellapp/widgets/expandable_text_widget.dart';
import 'package:booksellapp/widgets/pageicons.dart';
import 'package:booksellapp/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecomendedBooks extends StatelessWidget {
  int Pageid;
  RecomendedBooks({Key? key, required this.Pageid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recomendProductList[Pageid];
    Get.find<RecommendedProductController>().initRecomendProduct();
    return Scaffold(
      backgroundColor: const Color(0xff1e2023),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Container(
              padding: EdgeInsets.only(
                left: Dimentions.width12,
                right: Dimentions.width12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: PageIcons(
                      icon: Icons.clear,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  PageIcons(
                    icon: Icons.shopping_cart,
                    backgroundColor: Colors.black,
                  ),
                ],
              ),
            ),
            backgroundColor: const Color(0xff1e2023),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: const Color(0xff1e2023),
                ),
                width: double.maxFinite,
                child: Center(
                  child: SmallText(
                    displayText: product.name,
                    size: Dimentions.font26,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConst.baseUrl + AppConst.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(Dimentions.height20),
              child: ExpandableText(
                text: product.description,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:
          GetBuilder<RecommendedProductController>(builder: (recomendproduct) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.black54,
          ),
          height: 160,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        recomendproduct.setQty(false);
                      },
                      child: PageIcons(
                        icon: Icons.remove,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: MainTexts(
                          displayText:
                              '\$ ${product.price} X ${recomendproduct.qty}',
                          color: Colors.white54,
                        )),
                    GestureDetector(
                      onTap: () {
                        recomendproduct.setQty(true);
                      },
                      child: PageIcons(
                        icon: Icons.add,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: Dimentions.height5,
                  left: Dimentions.width50,
                  right: Dimentions.width50,
                ),
                height: Dimentions.height100,
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff1e2023),
                        borderRadius:
                            BorderRadius.circular(Dimentions.radius15),
                      ),
                      padding: EdgeInsets.all(Dimentions.height10),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff1e2953),
                        borderRadius:
                            BorderRadius.circular(Dimentions.radius15),
                      ),
                      padding: EdgeInsets.all(Dimentions.height10),
                      child: Row(
                        children: [
                          MainTexts(
                            displayText:
                                '\$ ${recomendproduct.qty * product.price} | Add to Cart ',
                            color: Colors.white54,
                            size: Dimentions.height20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
