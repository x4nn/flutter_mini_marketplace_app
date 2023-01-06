part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, failure }

class CartState extends Equatable {
  const CartState({
    this.status = CartStatus.initial,
    this.cart = const Cart(),
    this.lastDeletedItem,
  });

  final CartStatus status;
  final Cart cart;
  final CartItem? lastDeletedItem;

  CartState copyWith({
    CartStatus? status,
    List<CartItem>? cartItemList,
    CartItem? lastDeletedItem,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart.copyWith(cartItemList: cartItemList),
      lastDeletedItem: lastDeletedItem ?? this.lastDeletedItem,
    );
  }

  static CartState? fromJson(Map<String, dynamic> json) {
    return CartState(
      cart: Cart.fromJson(json),
      lastDeletedItem: CartItem.fromJson(json['last_deleted_item']),
    );
  }

  static Map<String, dynamic>? toJson(CartState state) {
    return {
      "cart": state.cart.toJson(),
      "last_deleted_item": state.lastDeletedItem != null ? state.lastDeletedItem!.toJson() : null,
    };
  }

  @override
  String toString() {
    return '''Cart { cart item list count: ${cart.cartItemList.length}\ntotal selected item: $cart.totalSelectedItem\ntotal selected item price: $cart.totalSelectedItemPrice}''';
  }

  @override
  List<Object?> get props => [status, cart, lastDeletedItem];
}
