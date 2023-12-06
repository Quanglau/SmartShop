import 'package:lauquang_doan/domain/entities/flash_sale_product.dart';
import 'package:lauquang_doan/domain/entities/product_category.dart';

class WebSoSanhHomeResponse {
  final List<FlashSaleProduct> flashSaleProducts;
  final List<ProductCategory> productCategories;
  const WebSoSanhHomeResponse({
    this.flashSaleProducts = const [],
    this.productCategories = const [],
  });
}
