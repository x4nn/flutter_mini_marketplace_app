import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/cart/bloc/cart_bloc.dart';
import 'package:mini_marketplace_app/cart/widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        CartBloc myCart = context.read<CartBloc>();
        // if (kDebugMode) print("Count : ${state.cartItemList.length}");

        if (myCart.state.cartItemList.isEmpty) {
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
                    child: myCart.state.cartItemList.map((e) => e.selected).toList().contains(true)
                        ? TextButton.icon(
                            onPressed: () => myCart.add(CartEventRemoveSelectedItem()),
                            icon: const Icon(Icons.delete),
                            label: const Text("Hapus"),
                          )
                        : const SizedBox(),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      value: myCart.state.cartItemList.every((element) => element.selected),
                      onChanged: (value) => myCart.add(CartEventSelectAllItem(select: value!)),
                      title: const Text("Pilih Semua", textAlign: TextAlign.end),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: myCart.state.cartItemList.length,
                itemBuilder: (context, index) {
                  var cartItem = myCart.state.cartItemList[index];
                  return CartItemCard(cartItem: cartItem, myCart: myCart);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
