import 'package:booksellapp/data/repository/populer_product_repo.dart';
import 'package:get/get.dart';

import '../data/repository/Recommended_prodcut_repo.dart';
import '../models/product_models.dart';
import '../utils/appcolor.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recomendProductList = [];
  List<dynamic> get recomendProductList => _recomendProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _qty = 0;
  int get qty => _qty;

  Future<void> getRecommedProductList() async {
    Response response = await recommendedProductRepo.getRecommedProductList();
    if (response.statusCode == 200) {
      print('got the list ');
      _recomendProductList = [];
      _recomendProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQty(bool _isIncresed) {
    if (_isIncresed) {
      _qty = _qty + 1;
      checkQty(_qty);
    } else {
      _qty = _qty - 1;
      checkQty(_qty);
    }
    update();
  }

  void checkQty(int qty) {
    if (_qty > 10) {
      _qty = 10;
      Get.snackbar(
        "Error Occurred ",
        "You Cant Add Items more than 10",
        backgroundColor: AppColor.notificationBg,
        colorText: AppColor.smallTextColor,
      );
    } else if (_qty < 0) {
      _qty = 0;
      Get.snackbar(
        "Error Occurred ",
        "Have At least one item",
        backgroundColor: AppColor.notificationBg,
        colorText: AppColor.smallTextColor,
      );
    } else {
      _qty = _qty;
    }
  }

  void initRecomendProduct() {
    _qty = 0;
  }
}
