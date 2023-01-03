import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_marketplace_app/catalog/model/models.dart';
import 'package:mini_marketplace_app/dummy_data/item_dummy.dart';

part 'catalog_state.dart';
part 'catalog_event.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
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
    //   final response = await httpClient.get(
    //     Uri.https(
    //       'jsonplaceholder.typicode.com',
    //       '/posts',
    //       <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
    //     ),
    //   );
    //   if (response.statusCode == 200) {
    //     final body = json.decode(response.body) as List;
    //     return body.map((dynamic json) {
    //       final map = json as Map<String, dynamic>;
    //       return Post(
    //         id: map['id'] as int,
    //         title: map['title'] as String,
    //         body: map['body'] as String,
    //       );
    //     }).toList();
    //   }
    //   throw Exception('error fetching posts');

    try {
      return myItem.map((e) {
        return Item(
          id: e.id,
          title: e.title,
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
}
