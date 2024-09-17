part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

 class GetAllProducts extends ProductsState {
  final List<Products> products;
  GetAllProducts({required this.products});
}
