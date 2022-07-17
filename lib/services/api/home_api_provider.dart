import 'package:shopigo_mobile/services/base_api.dart';

class HomeApiProvider extends BaseApi {
  Future<dynamic> getInventory({required productId}) async {
    return await get(endpoint: "inventory/get-product/" + productId);
  }

  Future<dynamic> getAllInventory() async {
    return await get(endpoint: "inventory/get-product");
  }
}
