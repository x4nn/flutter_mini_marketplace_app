import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mini_marketplace_app/features/cart/model/models.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Equatable {
  final List<CartItem> cartItemList;
  final int totalSelectedItem;
  final int totalSelectedItemPrice;

  const Cart({
    this.cartItemList = const <CartItem>[],
    this.totalSelectedItem = 0,
    this.totalSelectedItemPrice = 0,
  });

  Cart copyWith({List<CartItem>? cartItemList}) {
    int totalSelectedItem = countSelectedItem(cartItemList ?? this.cartItemList);

    return Cart(
      cartItemList: cartItemList ?? this.cartItemList,
      totalSelectedItem: totalSelectedItem,
      totalSelectedItemPrice: totalSelectedItem > 0 ? countSelectedItemPrice(cartItemList ?? this.cartItemList) : 0,
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

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);

  @override
  List<Object?> get props => [cartItemList, totalSelectedItem, totalSelectedItemPrice];
}
