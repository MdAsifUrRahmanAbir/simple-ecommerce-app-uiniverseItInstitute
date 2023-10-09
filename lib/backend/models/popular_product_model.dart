class PopularProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;
  final double discountPrice;
  final bool haveDiscount;
  final String currency;

  PopularProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.discountPrice,
    required this.haveDiscount,
    required this.currency,
  });

  // Factory method to create a PopularProductModel instance from a map (JSON)
  factory PopularProductModel.fromJson(Map<String, dynamic> json) {
    return PopularProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      discountPrice: (json['discountPrice'] as num).toDouble(),
      haveDiscount: json['haveDiscount'] as bool,
      currency: json['currency'] as String,
    );
  }

  // Method to convert a PopularProductModel instance to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'discountPrice': discountPrice,
      'haveDiscount': haveDiscount,
      'currency': currency,
    };
  }
}
