// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      cartItemList: (json['cartItemList'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CartItem>[],
      totalSelectedItem: json['totalSelectedItem'] as int? ?? 0,
      totalSelectedItemPrice: json['totalSelectedItemPrice'] as int? ?? 0,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'cartItemList': instance.cartItemList,
      'totalSelectedItem': instance.totalSelectedItem,
      'totalSelectedItemPrice': instance.totalSelectedItemPrice,
    };
