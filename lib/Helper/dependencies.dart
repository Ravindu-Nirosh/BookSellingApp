import 'package:booksellapp/controllers/populer_product_controller.dart';
import 'package:booksellapp/data/api/api_client.dart';
import 'package:booksellapp/data/repository/populer_product_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/Recommended_product_controller.dart';
import '../data/repository/Recommended_prodcut_repo.dart';
import '../utils/app_const.dart';

Future<void> init() async {
  //api
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConst.baseUrl));

  //repo
  Get.lazyPut(() => PopulerProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllr
  Get.lazyPut(() => PopulerProductController(populerProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
