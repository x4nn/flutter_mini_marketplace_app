import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mini_marketplace_app/config/helper/helper.dart';
import 'package:mini_marketplace_app/features/cart/model/cart.dart';
import 'package:mini_marketplace_app/features/cart/model/models.dart';
import 'package:mini_marketplace_app/features/catalog/catalog.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartEventAddItem>(_onAddItem);
    on<CartEventRemoveItem>(_onRemoveItem);
    on<CartEventRemoveSelectedItem>(_onRemoveSelectedItem);
    on<CartEventRemoveAllItem>(_onRemoveAllItem);
    on<CartEventUndoRemoveItem>(_onUndoRemoveItem);
    on<CartEventSelectItem>(_onSelect);
    on<CartEventSelectAllItem>(_onSelectAll);
  }

  Future<void> _onAddItem(CartEventAddItem event, Emitter<CartState> emit) async {
    final itemList = state.cart.cartItemList.map((e) => e.item).toList();
    List<CartItem> cartItemList;

    if (itemList.contains(event.item)) {
      int cartItemIndex = state.cart.cartItemList.indexWhere((c) => c.item.id == event.item.id);

      cartItemList = [...state.cart.cartItemList];
      cartItemList.replaceRange(
        cartItemIndex,
        cartItemIndex + 1,
        [CartItem(item: event.item, count: cartItemList[cartItemIndex].count + event.count)],
      );

      emit(state.copyWith(cartItemList: [...cartItemList]));
    } else {
      cartItemList = List.from(state.cart.cartItemList);
      emit(state.copyWith(cartItemList: [...cartItemList, CartItem(item: event.item)]));
    }
  }

  Future<void> _onRemoveItem(CartEventRemoveItem event, Emitter<CartState> emit) async {
    List<CartItem> cartItemList = List.from(state.cart.cartItemList)
      ..map((e) => e).toList()
      ..remove(event.cartItem)
      ..toList();

    emit(state.copyWith(cartItemList: cartItemList, lastDeletedItem: event.cartItem));
  }

  Future<void> _onRemoveSelectedItem(CartEventRemoveSelectedItem event, Emitter<CartState> emit) async {
    List<CartItem> newCartItemList = List.from(state.cart.cartItemList)
      ..toList()
      ..removeWhere((element) => element.selected)
      ..toList();

    emit(state.copyWith(cartItemList: newCartItemList));
  }

  Future<void> _onRemoveAllItem(CartEventRemoveAllItem event, Emitter<CartState> emit) async {
    List<CartItem> cartItemList = List.from(state.cart.cartItemList)
      ..clear()
      ..toList();

    emit(state.copyWith(cartItemList: cartItemList));
  }

  Future<void> _onUndoRemoveItem(CartEventUndoRemoveItem event, Emitter<CartState> emit) async {
    if (state.lastDeletedItem != null) {
      final CartItem cartItem = state.lastDeletedItem!;

      List<CartItem> cartItemList = List.from(state.cart.cartItemList)
        ..toList()
        ..add(cartItem);

      emit(state.copyWith(cartItemList: cartItemList, lastDeletedItem: null));
    }
  }

  void _onSelect(CartEventSelectItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = [...state.cart.cartItemList];

    int cartItemIndex = state.cart.cartItemList.indexWhere((c) => c.item.id == event.cartItemId);
    CartItem cartItem = cartItemList[cartItemIndex];

    cartItemList.replaceRange(
      cartItemIndex,
      cartItemIndex + 1,
      [CartItem(item: cartItem.item, count: cartItem.count, selected: event.select)],
    );

    emit(state.copyWith(cartItemList: [...cartItemList]));
  }

  void _onSelectAll(CartEventSelectAllItem event, Emitter<CartState> emit) {
    List<CartItem> cartItemList = List.from(state.cart.cartItemList).map((e) {
      e as CartItem;
      return e.copyWith(item: e.item, count: e.count, selected: event.select);
    }).toList();

    emit(state.copyWith(cartItemList: [...cartItemList]));
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    print("fromJson: $json");

    try {
      return CartState.fromJson(json);
    } catch (e) {
      throw Exception("$e | fromJson failed");
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    print("toJson: $state");

    try {
      return CartState.toJson(state);
    } catch (e) {
      throw Exception("$e | toJson failed");
    }
  }
}
