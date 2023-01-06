import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mini_marketplace_app/features/catalog/model/models.dart';
import 'package:mini_marketplace_app/dummy_data/item_dummy.dart';
import 'package:mini_marketplace_app/config/helper/helper.dart';

part 'catalog_state.dart';
part 'catalog_event.dart';

class CatalogBloc extends HydratedBloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(const CatalogState()) {
    on<CatalogFetched>(_onCatalogFetched);
  }

  Future<void> _onCatalogFetched(CatalogFetched event, Emitter<CatalogState> emit) async {
    try {
      if (state.status == CatalogStatus.initial) {
        final item = await _fetchProduct();
        return emit(state.copyWith(
          status: CatalogStatus.success,
          items: item,
        ));
      }

      final item = await _fetchProduct(state.items.length);

      emit(item.isEmpty
          ? state.copyWith()
          : state.copyWith(
              status: CatalogStatus.success,
              items: List.of(state.items)..addAll(item),
            ));
    } catch (_) {
      emit(state.copyWith(status: CatalogStatus.failure));
    }
  }

  Future<List<Item>> _fetchProduct([int startIndex = 0]) async {
    try {
      return myItem.map((e) {
        return Item(
          id: e.id,
          title: e.title,
          image: e.image,
          description: e.description,
          price: e.price,
          stock: e.stock,
          rating: e.rating,
        );
      }).toList();
    } catch (e) {
      throw Exception("Error fetching catalog");
    }
  }

  @override
  CatalogState? fromJson(Map<String, dynamic> json) {
    return CatalogState(
      items: (json['items'] as List<Map<String, dynamic>>)
          .map(
            (e) => Item.fromJson(e),
          )
          .toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(CatalogState state) {
    return {
      "items": encoder.convert(state.items.map((e) => e.toJson()).toList()),
    };
  }
}
