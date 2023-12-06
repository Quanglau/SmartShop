import 'package:flutter/material.dart';
import 'package:lauquang_doan/domain/entities/product.dart';

class ProductGridItemView extends StatelessWidget {
  const ProductGridItemView({
    super.key,
    required this.product,
    this.onTap,
  }) ;

  final Product product;
  final Function(String path)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap?.call(product.productUrl ?? '');

      },
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  product.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.price ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.name ?? '',
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_cart, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      'Có${product.shop ?? ''}nơi bán',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}