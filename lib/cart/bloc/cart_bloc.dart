import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/cart/model/cart_item.dart';
import 'package:mini_marketplace_app/catalog/model/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cart}) : super(cart) {
    on<CartEventAddItem>(_addItem);
    on<CartEventRemoveItem>(_removeItem);
    on<CartEventRemoveAllItem>(_removeAllItem);
    on<CartEventSelectItem>(_select);
    on<CartEventSelectAllItem>(_selectAll);
  }

  CartState cart;

  void _addItem(CartEventAddItem event, Emitter<CartState> emit) async {
    final itemList = state.cartItemList.map((e) => e.cartItem).toList();
    List<CartItem> cartItemList = List.from(state.cartItemList);

    if (itemList.contains(event.item)) {
      // Item lebih dari 1 | same item is greater than 1
      // increment the cart item count
      cartItemList.singleWhere((element) => element.cartItem.id == event.item.id).count += event.count;
    } else {
      cartItemList.add(CartItem(cartItem: event.item, count: 1));
    }

    emit(state.copyWith(cartItemList: cartItemList));
    // if (kDebugMode) print(state);
  }

  void _removeItem(CartEventRemoveItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
      ..map((e) => e).toList()
      ..remove(event.item)
      ..toList();

    emit(state.copyWith(cartItemList: cartItemList));
  }

  void _removeAllItem(CartEventRemoveAllItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
      ..clear()
      ..toList();

    emit(state.copyWith(cartItemList: cartItemList));
  }

  void _select(CartEventSelectItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList).map((e) {
      if (e == event.item) return CartItem(cartItem: e.cartItem, count: e.count, selected: event.select);

      return CartItem(cartItem: e.cartItem, count: e.count, selected: e.selected);
    }).toList();

    // if (kDebugMode) print("$cartItemList ${event.select}");

    emit(state.copyWith(cartItemList: cartItemList));
  }

  void _selectAll(CartEventSelectAllItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
        .map(
          (e) => CartItem(cartItem: e.cartItem, count: e.count, selected: event.select),
        )
        .toList();

    // if (kDebugMode) print("$cartItemList ${event.select}");

    emit(state.copyWith(cartItemList: cartItemList));
  }
}
