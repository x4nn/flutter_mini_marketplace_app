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

  @override
  String toString() {
    return '''Cart { cart item list count: ${cartItemList.length}\ntotal selected item: $totalSelectedItem\ntotal selected item price: $totalSelectedItemPrice}''';
  }

  @override
  List<Object?> get props => [cartItemList, totalSelectedItem, totalSelectedItemPrice, lastDeletedItem];
}
