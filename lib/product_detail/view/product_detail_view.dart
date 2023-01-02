import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/catalog/catalog.dart';
import 'package:mini_marketplace_app/product_detail/product_detail.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProductImageView(item: item),
        ProductDetailContent(item: item),
      ],
    );
  }
}
