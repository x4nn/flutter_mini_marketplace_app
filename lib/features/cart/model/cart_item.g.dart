// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 1,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'item': instance.item,
      'count': instance.count,
      'selected': instance.selected,
    };
