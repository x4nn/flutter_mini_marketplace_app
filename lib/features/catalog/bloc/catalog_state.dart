part of 'catalog_bloc.dart';

enum CatalogStatus { initial, success, failure }

class CatalogState extends Equatable {
  const CatalogState({
    this.status = CatalogStatus.initial,
    this.items = const <Item>[],
  });

  final CatalogStatus status;
  final List<Item> items;

  CatalogState copyWith({
    CatalogStatus? status,
    List<Item>? items,
  }) {
    return CatalogState(
      status: status ?? this.status,
      items: items ?? this.items,
    );
  }

  @override
  String toString() {
    return '''CatalogState { status: $status, posts: ${items.length} }''';
  }

  @override
  List<Object> get props => [status, items];
}
