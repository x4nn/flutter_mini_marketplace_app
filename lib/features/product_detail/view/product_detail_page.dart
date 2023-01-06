import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mini_marketplace_app/features/cart/cart.dart';
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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                context.read<CartBloc>().add(CartEventAddItem(item: item, count: 1));
                Fluttertoast.cancel().whenComplete(() {
                  Fluttertoast.showToast(msg: '"${item.title}" telah dimasukkan ke keranjang');
                });
              },
              icon: const Icon(Icons.shopping_cart_checkout, size: 32),
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Tambah ke keranjang",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(275, 75),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
