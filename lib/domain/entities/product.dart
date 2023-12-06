import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final String? name;
  final String? price;
  final String? imageUrl;
  final String? productUrl;
  final String? shop;
  const Product({
    this.name,
    this.price,
    this.imageUrl,
    this.productUrl,
    this.shop,
  });
  const Product.empty()
      : name = '',
        price = '',
        imageUrl = '',
        productUrl = '',
        shop = '';
  //from json
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
