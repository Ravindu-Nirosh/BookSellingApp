import 'package:booksellapp/data/repository/populer_product_repo.dart';
import 'package:booksellapp/utils/appcolor.dart';
import 'package:get/get.dart';

import '../models/product_models.dart';

class PopulerProductController extends GetxController {
  final PopulerProductRepo populerProductRepo;

  PopulerProductController({required this.populerProductRepo});

  List<dynamic> _populerProductList = [];
  List<dynamic> get populerProductList => _populerProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _count = 0;
  int get count => _count;
  int _cartItems = 0;
  int get cartItem => _cartItems;

  Future<void> getPopulerProductList() async {
    Response response = await populerProductRepo.getPopulerProductList();
    if (response.statusCode == 200) {
      print('got the list ');
      _populerProductList = [];
      _populerProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print(response.statusCode);
    }
  }

  void setIncrements(bool _isIncresed) {
    if (_isIncresed) {
      _count = checkCount(_count + 1);
    } else {
      _count = checkCount(_count - 1);
    }
    update();
  }

  int checkCount(int qty) {
    if (qty >= 10) {
      Get.snackbar(
        "Error Occurred ",
        "You Cant Add Items more than 20",
        backgroundColor: AppColor.notificationBg,
        colorText: AppColor.smallTextColor,
      );
      return 10;
    } else if (qty <= 0) {
      Get.snackbar(
        "Error Occurred ",
        "Have At least one item",
        backgroundColor: AppColor.notificationBg,
        colorText: AppColor.smallTextColor,
      );
      return 0;
    } else {
      return qty;
    }
  }

  void initPopulerProduct() {
    _count = 0;
  }
}
