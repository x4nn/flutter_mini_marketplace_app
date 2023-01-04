part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CatalogFetched extends CatalogEvent {}
