import 'package:booksellapp/pages/books/recomended_books_details.dart';
import 'package:booksellapp/pages/home/mainbookpage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/books/populer_books.dart';

class RouteHelper {
  static const String initial = "/";
  static const String populerProducts = "/populer-products";
  static const String recomendedProducts = "/recomendded-products";

  static String getInitial() => '$initial';
  static String getPopulerFood(int pageId) => '$populerProducts?pageId=$pageId';
  static String getRecommendeFood(int pageId) =>
      '$recomendedProducts?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => MainBookPage()),
    GetPage(
      name: populerProducts,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopulerBookPages(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.downToUp,
    ),
    GetPage(
      name: recomendedProducts,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecomendedBooks(
          Pageid: int.parse(pageId!),
        );
      },
      transition: Transition.downToUp,
    )
  ];
}
