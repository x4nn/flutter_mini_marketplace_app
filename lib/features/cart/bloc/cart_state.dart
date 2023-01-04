part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    required this.cartItemList,
    this.totalSelectedItem = 0,
    this.totalSelectedItemPrice = 0,
    this.lastDeletedItem,
  });

  final List<CartItem> cartItemList;
  final int totalSelectedItem;
  final int totalSelectedItemPrice;
  final CartItem? lastDeletedItem;

  CartState copyWith({
    List<CartItem>? cartItemList,
    CartItem? lastDeletedItem,
  }) {
    int totalSelectedItem = countSelectedItem(cartItemList ?? this.cartItemList);

    return CartState(
      cartItemList: cartItemList ?? this.cartItemList,
      totalSelectedItem: totalSelectedItem,
      totalSelectedItemPrice: totalSelectedItem > 0 ? countSelectedItemPrice(cartItemList ?? this.cartItemList) : 0,
      lastDeletedItem: lastDeletedItem ?? this.lastDeletedItem,
    );
  }

  int countSelectedItem(List<CartItem> cartItemList) {
    return cartItemList.isNotEmpty ? cartItemList.where((item) => item.selected).length : 0;
  }

  int countSelectedItemPrice(List<CartItem> cartItemList) {
    int totalSelectedItemPrice = cartItemList.map((item) {
      return item.selected ? item.item.price * item.count : 0;
    }).reduce((item1, item2) => item1 + item2);

    return totalSelectedItemPrice;
  }

  static CartState? fromJson(Map<String, dynamic> json) {
    return CartState(
      cartItemList: (decoder.convert(json['cart_item_list']) as List).map((e) => CartItem.fromJson(e)).toList(),
      totalSelectedItem: json['total_selected_item'],
      totalSelectedItemPrice: json['total_selected_item_price'],
      lastDeletedItem: CartItem.fromJson(json['last_deleted_item']),
    );
  }

  static Map<String, dynamic>? toJson(CartState state) {
    const sus = Item(id: 00, title: '', description: '', price: 0, stock: 0, rating: 0, image: '');
    return {
      "cart_item_list": encoder.convert(state.cartItemList.map((e) => CartItem.toJson(e)).toList()),
      "total_selected_item": state.totalSelectedItem,
      "total_selected_item_price": state.totalSelectedItemPrice,
      "last_deleted_item": encoder.convert(CartItem.toJson(state.lastDeletedItem ?? const CartItem(item: sus))),
    };
  }

  @override
  String toString() {
    return '''Cart { cart item list count: ${cartItemList.length}\ntotal selected item: $totalSelectedItem\ntotal selected item price: $totalSelectedItemPrice}''';
  }

  @override
  List<Object?> get props => [cartItemList, totalSelectedItem, totalSelectedItemPrice, lastDeletedItem];
}
