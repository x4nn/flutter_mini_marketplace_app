import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  const Item({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.stock,
    required this.rating,
  });

  final int id;
  final String title;
  final String image;
  final String description;
  final int price;
  final int stock;
  final double rating;

  @override
  List<Object?> get props => [id, title, description, price, stock];

  factory Item.fromJson(Map<String, dynamic> json) {
    return _$ItemFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemToJson(this);
  }
}
