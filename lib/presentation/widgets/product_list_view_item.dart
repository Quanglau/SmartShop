import 'package:flutter/material.dart';
import 'package:lauquang_doan/domain/entities/product.dart';

class ProductListViewItem extends StatelessWidget {
  final Product product;
  final Function()? onTap;
  final Function(String)? onDeteteTap;
  final bool isShowShopName;

  const ProductListViewItem({super.key, required this.product, this.onTap, this.onDeteteTap, this.isShowShopName = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl ?? '',
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(product.name ?? 'Sản phẩm',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if(isShowShopName == false) const SizedBox(height: 4),
                      Text(product.price ?? '0',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        )),
                    const SizedBox(height: 4),
                    if(isShowShopName ) Text(product.shop ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
            ),
            // DeleteButton
            if(onDeteteTap != null )IconButton(
              onPressed: () {
                onDeteteTap!(product.name ?? '');
              },
              icon: const Icon(Icons.delete, color: Colors.red, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}
