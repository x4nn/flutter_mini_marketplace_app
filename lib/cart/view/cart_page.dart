import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/cart/view/view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang"), centerTitle: true),
      body: const CartView(),
    );
  }
}
