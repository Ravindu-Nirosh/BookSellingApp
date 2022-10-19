import 'package:booksellapp/data/api/api_client.dart';
import 'package:get/get.dart';

class PopulerProductRepo extends GetxService {
  final ApiClient apiClient;

  PopulerProductRepo({required this.apiClient});

  Future<Response> getPopulerProductList() async {
    return await apiClient.getData('/api/v1/products/popular');
  }
}
