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
    return Dismissible(
      key: Key('${cartItem.cartItem.id}'),
      onDismissed: (direction) {
        myCart.add(CartEventRemoveItem(item: cartItem));
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text("${cartItem.cartItem.title} dihapus dari keranjang"),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: "Urungkan",
                onPressed: () => myCart.add(CartEventUndoRemoveItem()),
              ),
            ),
          );
      },
      child: Card(
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
              Padding(
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Jumlah : ${cartItem.count}", style: textTheme.bodyMedium),
                          Text("Total : Rp${cartItem.cartItem.price * cartItem.count}", style: textTheme.bodyLarge),
                        ],
                      ),
                    ),
                    // const VerticalDivider(),
                    // IconButton(
                    //   onPressed: () => myCart.add(CartEventRemoveItem(item: cartItem)),
                    //   icon: const Icon(Icons.delete),
                    // ),
                    const VerticalDivider(indent: 0, endIndent: 0),
                    Checkbox(
                      value: cartItem.selected,
                      onChanged: (value) => myCart.add(CartEventSelectItem(item: cartItem, select: value!)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
