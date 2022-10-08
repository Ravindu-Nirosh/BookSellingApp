import 'package:booksellapp/widgets/MainText.dart';
import 'package:booksellapp/widgets/small_text.dart';
import 'package:flutter/material.dart';
import '../utils/appcolor.dart';
import 'bookItempages.dart';

class MainBookPage extends StatefulWidget {
  const MainBookPage({Key? key}) : super(key: key);

  @override
  State<MainBookPage> createState() => _MainBookPageState();
}

class _MainBookPageState extends State<MainBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 30.0, bottom: 10),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MainTexts(
                        displayText: 'Country',
                        color: AppColor.mainIconBgColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            displayText: 'City',
                            color: Colors.grey,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.mainIconBgColor,
                      ),
                      child: const Icon(
                        Icons.search,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: BookItemsPages(),
          ))
        ],
      ),
    );
  }
}
