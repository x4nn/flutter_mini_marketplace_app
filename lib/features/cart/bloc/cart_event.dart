part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartEventAddItem extends CartEvent {
  const CartEventAddItem({required this.item, this.count = 1});

  final Item item;
  final int count;

  @override
  List<Object?> get props => [item, count];
}

class CartEventRemoveItem extends CartEvent {
  const CartEventRemoveItem({required this.cartItem});

  final CartItem cartItem;

  @override
  List<Object?> get props => [cartItem];
}

class CartEventRemoveSelectedItem extends CartEvent {
  const CartEventRemoveSelectedItem();

  @override
  List<Object?> get props => [];
}

class CartEventRemoveAllItem extends CartEvent {
  const CartEventRemoveAllItem();

  @override
  List<Object?> get props => [];
}

class CartEventUndoRemoveItem extends CartEvent {
  const CartEventUndoRemoveItem();

  @override
  List<Object?> get props => [];
}

class CartEventSelectItem extends CartEvent {
  const CartEventSelectItem({required this.cartItemId, required this.select});

  final int cartItemId;
  final bool select;

  @override
  List<Object?> get props => [cartItemId, select];
}

class CartEventSelectAllItem extends CartEvent {
  const CartEventSelectAllItem({required this.select});

  final bool select;

  @override
  List<Object?> get props => [select];
}
