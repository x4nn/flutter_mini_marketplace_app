import 'package:equatable/equatable.dart';
import 'package:mini_marketplace_app/features/catalog/catalog.dart';

class CartItem extends Equatable {
  const CartItem({required this.item, this.count = 1, this.selected = false});

  final Item item;
  final int count;
  final bool selected;

  CartItem copyWith({Item? item, int? count, bool? selected}) {
    return CartItem(
      item: item ?? this.item,
      count: count ?? this.count,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [item, count, selected];
}
