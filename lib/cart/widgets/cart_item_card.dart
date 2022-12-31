import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/cart/bloc/cart_bloc.dart';
import 'package:mini_marketplace_app/cart/model/models.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.myCart,
  }) : super(key: key);

  final CartItem cartItem;
  final CartBloc myCart;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                ),
                child: const Center(child: Text("Gambar item")),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cartItem.cartItem.title, style: textTheme.titleMedium),
                    Text('Rp${cartItem.cartItem.price}', style: textTheme.titleLarge),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Jumlah : ${cartItem.count}", style: textTheme.bodyMedium),
                  Checkbox(
                    value: cartItem.selected,
                    onChanged: (value) {
                      myCart.add(CartEventSelectItem(item: cartItem, select: value!));
                      // if (kDebugMode) print("Checkbox press $value");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
