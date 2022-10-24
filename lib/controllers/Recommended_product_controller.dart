import 'package:booksellapp/data/repository/populer_product_repo.dart';
import 'package:get/get.dart';

import '../data/repository/Recommended_prodcut_repo.dart';
import '../models/product_models.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recomendProductList = [];
  List<dynamic> get recomendProductList => _recomendProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

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
}
