part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({required this.cartItemList, this.lastDeletedItem});

  final List<CartItem> cartItemList;
  final CartItem? lastDeletedItem;

  CartState copyWith({
    List<CartItem>? cartItemList,
    CartItem? lastDeletedItem,
  }) {
    return CartState(
      cartItemList: cartItemList ?? this.cartItemList,
      lastDeletedItem: lastDeletedItem ?? this.lastDeletedItem,
    );
  }

  @override
  List<Object?> get props => [cartItemList];
}
