import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/features/catalog/model/models.dart';
import 'package:mini_marketplace_app/features/product_detail/product_detail.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailView(item: item),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
