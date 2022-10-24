import 'package:booksellapp/data/api/api_client.dart';
import 'package:booksellapp/utils/app_const.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommedProductList() async {
    return await apiClient.getData(AppConst.recommendProduct);
  }
}
