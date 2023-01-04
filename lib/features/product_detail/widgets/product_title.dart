import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/features/catalog/model/models.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key? key,
    required this.item,
    required this.sliverAppBarScrollFactor,
  }) : super(key: key);

  final Item item;
  final double sliverAppBarScrollFactor;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: Text(
        item.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      titlePadding: EdgeInsetsDirectional.only(
        // ubah ukuran title padding agar tidak bertumupuk dengan back button
        // change title padding size so they don't overlap with back button
        start: lerpDouble(72.0, 16.0, sliverAppBarScrollFactor)!,
        bottom: 16,
      ),
    );
  }
}
