import 'package:shopigo_mobile/feature/home/model/inventory_res_model.dart';
import 'package:shopigo_mobile/services/api/home_api_provider.dart';

class HomeRepository {
  static final HomeRepository _instance = HomeRepository.internal();
  HomeRepository.internal();
  factory HomeRepository() => _instance;

  final HomeApiProvider _apiProvider = HomeApiProvider();

  Future<InventoryResModel> getInventoryApi({required String productId}) async {
    var responseJson = await _apiProvider.getInventory(productId: productId);
    return InventoryResModel.fromJson(responseJson);
  }

  Future<InventoryResModel> getAllInventoryApi() async {
    var responseJson = await _apiProvider.getAllInventory();
    return InventoryResModel.fromJson(responseJson);
  }
}
