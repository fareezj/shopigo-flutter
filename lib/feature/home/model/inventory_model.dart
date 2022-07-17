class InventoryModel {
  final String? id;
  final String? productName;
  final String? productDescription;
  final String? productImage;
  final double? productPrice;
  final double? productRating;
  final int? productQuantity;

  InventoryModel({
    this.id,
    this.productName,
    this.productDescription,
    this.productImage,
    this.productPrice,
    this.productRating,
    this.productQuantity,
  });

  factory InventoryModel.fromJson(Map<String, dynamic> parsedJson) {
    return InventoryModel(
      id: parsedJson["id"],
      productName: parsedJson["productName"],
      productDescription: parsedJson["productDescription"],
      productImage: parsedJson["productImage"],
      productPrice: parsedJson["productPrice"],
      productRating: parsedJson["productRating"],
      productQuantity: parsedJson["productQuantity"],
    );
  }
}
