import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/features/cart/bloc/cart_bloc.dart';
import 'package:mini_marketplace_app/features/cart/view/view.dart';
import 'package:mini_marketplace_app/features/cart/widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang"), centerTitle: true),
      body: const CartView(),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.cartItemList.isEmpty ? const SizedBox(height: 100) : CheckoutButton(state: state);
        },
      ),
    );
  }
}
