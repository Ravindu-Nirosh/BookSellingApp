import 'package:booksellapp/data/repository/populer_product_repo.dart';
import 'package:get/get.dart';

import '../models/product_models.dart';

class PopulerProductController extends GetxController {
  final PopulerProductRepo populerProductRepo;

  PopulerProductController({required this.populerProductRepo});

  List<dynamic> _populerProductList = [];
  List<dynamic> get populerProductList => _populerProductList;

  Future<void> getPopulerProductList() async {
    Response response = await populerProductRepo.getPopulerProductList();
    if (response.statusCode == 200) {
      print('got the list ');
      _populerProductList = [];
      _populerProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {}
  }
}
