import 'package:json_annotation/json_annotation.dart';
import 'package:lauquang_doan/domain/entities/product.dart';
part 'detail_product.g.dart';

@JsonSerializable()
class DetailProduct {
  final String? name;
  final String? price;
  final List<String?> galleryImageUrls;
  final List<Product> compareProducts;
  final List<Product> similarProducts;
  const DetailProduct({
    this.name,
    this.price,
    this.galleryImageUrls = const [],
    this.compareProducts = const [],
    this.similarProducts = const [],
  });
  const DetailProduct.empty()
      : name = '',
        price = '',
        galleryImageUrls = const [],
        compareProducts = const [],
        similarProducts = const [];
  factory DetailProduct.fromJson(Map<String, dynamic> json) =>
      _$DetailProductFromJson(json);
  Map<String, dynamic> toJson() => _$DetailProductToJson(this);
}
