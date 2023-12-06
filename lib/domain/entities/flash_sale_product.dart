import 'package:lauquang_doan/domain/entities/product.dart';

class FlashSaleProduct extends Product {
  final String? salePrice;
  const FlashSaleProduct({
    String? name,
    String? price,
    String? imageUrl,
    String? productUrl,
    String? shop,
    this.salePrice,
  }) : super(
          name: name,
          price: price,
          imageUrl: imageUrl,
          productUrl: productUrl,
          shop: shop,
        );
}
