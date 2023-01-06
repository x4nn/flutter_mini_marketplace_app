// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      stock: json['stock'] as int,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'stock': instance.stock,
      'rating': instance.rating,
    };
