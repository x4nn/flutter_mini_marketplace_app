import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/cart/bloc/cart_bloc.dart';
import 'package:mini_marketplace_app/cart/model/cart_item.dart';
import 'package:mini_marketplace_app/cart/view/view.dart';
import 'package:mini_marketplace_app/cart/widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang"), centerTitle: true),
      body: const CartView(),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItemList.isEmpty) return const SizedBox(height: 100);

          List<CartItem> cartItems = context.read<CartBloc>().state.cartItemList;

          int totalSelectedItem = cartItems.where((item) => item.selected).length;

          int totalSelectedPrice = totalSelectedItem > 0
              ? cartItems.map((item) {
                  return item.selected ? item.cartItem.price * item.count : 0;
                }).reduce((item1, item2) => item1 + item2)
              : 0;

          return CheckoutButton(totalSelectedItem: totalSelectedItem, totalSelectedPrice: totalSelectedPrice);
        },
      ),
    );
  }
}
