import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/features/cart/bloc/cart_bloc.dart';
import 'package:mini_marketplace_app/features/cart/model/models.dart';
import 'package:mini_marketplace_app/features/cart/widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        CartBloc cartBloc = context.read<CartBloc>();
        Cart cart = state.cart;
        if (kDebugMode) print("Cart item count : ${cart.cartItemList.length}");

        if (cart.cartItemList.isEmpty) {
          if (kDebugMode) print("Cart Empty!");
          return Center(child: Text("Sepertinya keranjangmu masih kosong! :(", style: textTheme.titleMedium));
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: cart.cartItemList.map((e) => e.selected).toList().contains(true)
                        ? TextButton.icon(
                            onPressed: () => cartBloc.add(const CartEventRemoveSelectedItem()),
                            icon: const Icon(Icons.delete),
                            label: const Text("Hapus"),
                          )
                        : const SizedBox(),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      value: cart.cartItemList.every((element) => element.selected),
                      onChanged: (value) => cartBloc.add(CartEventSelectAllItem(select: value!)),
                      title: const Text("Pilih Semua", textAlign: TextAlign.end),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: cart.cartItemList.length,
                itemBuilder: (context, index) {
                  var cartItem = cart.cartItemList[index];
                  return CartItemCard(cartItem: cartItem, myCart: cartBloc);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
