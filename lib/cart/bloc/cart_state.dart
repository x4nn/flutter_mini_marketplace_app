part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({required this.cartItemList});

  final List<CartItem> cartItemList;

  CartState copyWith({required List<CartItem> cartItemList}) {
    return CartState(cartItemList: cartItemList);
  }

  @override
  List<Object?> get props => [cartItemList];
}
