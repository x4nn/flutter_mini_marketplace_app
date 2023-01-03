import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/catalog/model/models.dart';
import 'package:mini_marketplace_app/cart/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cart}) : super(cart) {
    on<CartEventAddItem>(_onAddItem);
    on<CartEventRemoveItem>(_onRemoveItem);
    on<CartEventRemoveSelectedItem>(_onRemoveSelectedItem);
    on<CartEventRemoveAllItem>(_onRemoveAllItem);
    on<CartEventUndoRemoveItem>(_onUndoRemoveItem);
    on<CartEventSelectItem>(_onSelect);
    on<CartEventSelectAllItem>(_onSelectAll);
  }

  CartState cart;

  void _onAddItem(CartEventAddItem event, Emitter<CartState> emit) async {
    List<CartItem> cartItemList = List.from(state.cartItemList);
    final itemList = state.cartItemList.map((e) => e.item).toList();

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

  void _onRemoveItem(CartEventRemoveItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
      ..map((e) => e).toList()
      ..remove(event.item)
      ..toList();

    emit(state.copyWith(cartItemList: cartItemList, lastDeletedItem: event.item));
  }

  void _onRemoveSelectedItem(CartEventRemoveSelectedItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
      ..removeWhere((element) => element.selected)
      ..toList();

    emit(state.copyWith(cartItemList: cartItemList));
  }

  void _onRemoveAllItem(CartEventRemoveAllItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
      ..clear()
      ..toList();

    emit(state.copyWith(cartItemList: cartItemList));
  }

  void _onUndoRemoveItem(CartEventUndoRemoveItem event, Emitter<CartState> emit) {
    final CartItem cartItem = state.lastDeletedItem!;

    List<CartItem> cartItemList = List.from(state.cartItemList)
      ..toList()
      ..add(cartItem);

    emit(state.copyWith(cartItemList: cartItemList, lastDeletedItem: null));
  }

  void _onSelect(CartEventSelectItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList).map((e) {
      if (e == event.item) return CartItem(cartItem: e.cartItem, count: e.count, selected: event.select);

      return CartItem(cartItem: e.cartItem, count: e.count, selected: e.selected);
    }).toList();

    // if (kDebugMode) print("$cartItemList ${event.select}");

    emit(state.copyWith(cartItemList: cartItemList));
  }

  void _onSelectAll(CartEventSelectAllItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
        .map(
          (e) => CartItem(cartItem: e.cartItem, count: e.count, selected: event.select),
        )
        .toList();

    // if (kDebugMode) print("$cartItemList ${event.select}");

    emit(state.copyWith(cartItemList: cartItemList));
  }
}
