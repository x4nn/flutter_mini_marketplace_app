import 'package:flutter/material.dart';
import 'package:mini_marketplace_app/features/catalog/model/models.dart';
import 'package:mini_marketplace_app/features/product_detail/product_detail.dart';

class CatalogListItem extends StatelessWidget {
  const CatalogListItem({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: textTheme.titleLarge),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Rp${item.price}', style: textTheme.titleMedium),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),
                              Text('${item.rating}', style: textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              splashColor: const Color.fromARGB(101, 33, 149, 243),
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => ProductDetailPage(item: item),
                );
                Navigator.of(context).push(route);
              },
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
