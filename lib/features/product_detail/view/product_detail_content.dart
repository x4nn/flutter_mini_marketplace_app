import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/features/catalog/model/models.dart';

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        title: const Text("Deskripsi"),
                        initiallyExpanded: true,
                        children: [
                          Text(item.description),
                        ],
                      ),
                      ListTile(
                        leading: const Icon(Icons.star),
                        title: Text("Rating : ${item.rating}"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        childCount: 1,
      ),
      itemExtent: MediaQuery.of(context).size.height,
    );
  }
}
