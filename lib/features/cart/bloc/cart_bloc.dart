import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/foundation.dart';
import 'package:mini_marketplace_app/features/cart/model/models.dart';
import 'package:mini_marketplace_app/features/catalog/catalog.dart';

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
    final itemList = state.cartItemList.map((e) => e.item).toList();
    List<CartItem> cartItemList;

    if (itemList.contains(event.item)) {
      // Item lebih dari 1 | same item is greater than 1
      // increment the cart item count
      cartItemList = List.from(state.cartItemList).map((e) {
        e as CartItem;
        if (e.item.id == event.item.id) {
          return e.copyWith(
            item: event.item,
            count: e.count + event.count,
            selected: e.selected,
          );
        }
        return e.copyWith(
          item: e.item,
          count: e.count,
          selected: e.selected,
        );
      }).toList();
    } else {
      cartItemList = List.from(state.cartItemList)..add(CartItem(item: event.item, count: 1));
    }

    emit(state.copyWith(cartItemList: cartItemList));
    // if (kDebugMode) print(state);
  }

  void _onRemoveItem(CartEventRemoveItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList)
      ..map((e) => e).toList()
      ..remove(event.item)
      ..toList();

    emit(state.copyWith(
      cartItemList: cartItemList,
      lastDeletedItem: event.item,
    ));
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
      e as CartItem;
      if (e.item.id == event.cartItem.item.id) {
        return e.copyWith(
          item: e.item,
          count: e.count,
          selected: event.select,
        );
      }
      return e.copyWith(
        item: e.item,
        count: e.count,
        selected: e.selected,
      );
    }).toList();

    emit(state.copyWith(cartItemList: cartItemList));
  }

  void _onSelectAll(CartEventSelectAllItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cartItemList).map((e) {
      e as CartItem;
      return e.copyWith(item: e.item, count: e.count, selected: event.select);
    }).toList();

    // if (kDebugMode) print("$cartItemList ${event.select}");

    emit(state.copyWith(cartItemList: cartItemList));
  }
}
