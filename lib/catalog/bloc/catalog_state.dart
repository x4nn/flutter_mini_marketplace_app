part of 'catalog_bloc.dart';

enum CatalogStatus { initial, success, failure }

class CatalogState extends Equatable {
  const CatalogState({
    this.status = CatalogStatus.initial,
    this.item = const <Item>[],
  });

  final CatalogStatus status;
  final List<Item> item;

  CatalogState copyWith({
    CatalogStatus? status,
    List<Item>? item,
  }) {
    return CatalogState(
      status: status ?? this.status,
      item: item ?? this.item,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, posts: ${item.length} }''';
  }

  @override
  List<Object> get props => [status, item];
}
