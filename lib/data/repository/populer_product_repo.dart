import 'package:booksellapp/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_const.dart';

class PopulerProductRepo extends GetxService {
  final ApiClient apiClient;

  PopulerProductRepo({required this.apiClient});

  Future<Response> getPopulerProductList() async {
    return await apiClient.getData(AppConst.populerFoodurl);
  }
}
