import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/features/catalog/model/models.dart';
import 'package:mini_marketplace_app/features/product_detail/product_detail.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  final double expandedSliverAppBarHeight = 540;

  @override
  Widget build(BuildContext context) {
    double sliverAppBarScrollFactor = 0.0;
    return SliverAppBar(
      expandedHeight: expandedSliverAppBarHeight,
      actions: const [
        // FavBtn(planetIndex: widget.planetIndex), TODO: add cart button
        // ShareBtn(planet: widget.planet),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          // mendapatkan nilai 0.0 - 1.0 dari space pada flexibleSpaceBar
          // get value from 0.0 - 1.0 from flexiblespacebar space
          sliverAppBarScrollFactor =
              (constraints.biggest.height - (MediaQuery.of(context).padding.top + kToolbarHeight)) / (expandedSliverAppBarHeight - kToolbarHeight);

          return Stack(
            children: [
              ProductImage(sliverAppBarScrollFactor: sliverAppBarScrollFactor, item: item),
              ProductTitle(item: item, sliverAppBarScrollFactor: sliverAppBarScrollFactor),
            ],
          );
        },
      ),
      floating: true,
      pinned: true,
    );
  }
}
