import 'package:booksellapp/widgets/MainText.dart';
import 'package:booksellapp/widgets/expandable_text_widget.dart';
import 'package:booksellapp/widgets/pageicons.dart';
import 'package:flutter/material.dart';
import '../../utils/dimentions.dart';
import '../../widgets/app_icon_text_rating_column.dart';

class PopulerBookPages extends StatelessWidget {
  const PopulerBookPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/book2.jpg"))),
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
                  PageIcons(
                    icon: Icons.arrow_back,
                    backgroundColor: Color(0xff000000),
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
                  AppColumn(text: 'Biriyani'),
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
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text:
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: Dimentions.height15,
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
                  Icon(Icons.remove),
                  SizedBox(
                    width: Dimentions.width10,
                  ),
                  MainTexts(
                    displayText: '0',
                    size: Dimentions.width30,
                    color: Colors.white54,
                  ),
                  SizedBox(
                    width: Dimentions.width10,
                  ),
                  Icon(
                    Icons.add,
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
                    displayText: '\$0.8 ',
                    color: Colors.white54,
                  ),
                  MainTexts(
                    displayText: 'Add To Cart',
                    color: Colors.white54,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
