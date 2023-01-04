import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/features/catalog/bloc/catalog_bloc.dart';
import 'package:mini_marketplace_app/features/catalog/widgets/widgets.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    CatalogBloc myCatalogBloc = context.read<CatalogBloc>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.60,
            ),
            itemCount: myCatalogBloc.state.items.length,
            itemBuilder: (context, index) {
              return CatalogListItem(item: myCatalogBloc.state.items[index]);
            },
          );
        },
      ),
    );
  }
}
