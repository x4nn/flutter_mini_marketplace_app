// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mini_marketplace_app/catalog/catalog.dart';

class CartItem extends Equatable {
  CartItem({required this.cartItem, this.count = 1, this.selected = false});

  final Item cartItem;
  late int count;
  late bool selected;

  @override
  List<Object?> get props => [cartItem, count, selected];
}
