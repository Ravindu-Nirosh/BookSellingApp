import 'package:booksellapp/pages/books/populer_books.dart';
import 'package:booksellapp/pages/books/recomended_books_details.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booksellapp/Helper/dependencies.dart' as depnd;

import 'controllers/populer_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await depnd.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopulerProductController>().getPopulerProductList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const RecomendedBooks(),
    );
  }
}
