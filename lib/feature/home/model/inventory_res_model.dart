import 'package:shopigo_mobile/feature/home/model/inventory_model.dart';

class InventoryResModel {
  final int? statusCode;
  final String? message;
  final List<InventoryModel>? result;

  InventoryResModel({
    this.statusCode,
    this.message,
    this.result,
  });

  factory InventoryResModel.fromJson(Map<String, dynamic> parsedJson) {
    var resultList = parsedJson["result"] as List;
    List<InventoryModel> resultListData =
        resultList.map((e) => InventoryModel.fromJson(e)).toList();

    return InventoryResModel(
      statusCode: parsedJson["statusCode"],
      message: parsedJson["message"],
      result: resultListData,
    );
  }
}
