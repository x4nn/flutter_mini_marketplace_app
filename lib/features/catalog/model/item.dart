import 'package:equatable/equatable.dart';

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

  static Item fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      rating: json['rating'],
    );
  }

  static Map<String, dynamic> toJson(Item item) {
    return {
      "id": item.id,
      "title": item.title,
      "image": item.image,
      "description": item.description,
      "price": item.price,
      "stock": item.stock,
      "rating": item.rating,
    };
  }
}
