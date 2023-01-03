// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mini_marketplace_app/catalog/catalog.dart';

class CartItem extends Equatable {
  const CartItem({required this.item, this.count = 1, this.selected = false});

  final Item item;
  final int count;
  final bool selected;


  @override
  List<Object?> get props => [cartItem, count, selected];
}
