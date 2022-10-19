import 'package:booksellapp/controllers/populer_product_controller.dart';
import 'package:booksellapp/data/api/api_client.dart';
import 'package:booksellapp/data/repository/populer_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> init() async {
  //api
  Get.lazyPut(() => ApiClient(appBaseUrl: 'http://mvs.bslmeiyu.com'));

  //repo
  Get.lazyPut(() => PopulerProductRepo(apiClient: Get.find()));

  //controllr
  Get.lazyPut(() => PopulerProductController(populerProductRepo: Get.find()));
}
