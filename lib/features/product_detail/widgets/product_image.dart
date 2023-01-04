import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/features/catalog/model/models.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.sliverAppBarScrollFactor,
    required this.item,
  }) : super(key: key);

  final double sliverAppBarScrollFactor;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Opacity(
        opacity: lerpDouble(0.0, 1.0, clampDouble(sliverAppBarScrollFactor * 4, 0, 1))!,
        child: Image(
          image: AssetImage(item.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
