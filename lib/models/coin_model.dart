class CoinModel {
  final String? name;
  final String? image;
  final double? currentPrice;

  CoinModel({
    this.name,
    this.image,
    this.currentPrice,
  });

  CoinModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        image = json['image'] as String?,
        currentPrice = json['current_price'] as double?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'current_price': currentPrice,
      };
}
