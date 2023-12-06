import 'package:lauquang_doan/domain/entities/product.dart';

class ProductCategory {
  final String? name;
  final String? imageUrl;
  final List<Product> products;
  final String? seeMoreUrl;
  const ProductCategory({
    this.name,
    this.imageUrl,
    this.products = const [],
    this.seeMoreUrl,
  });
}
