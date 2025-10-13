part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  ProductLoaded(this.products);
}

final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

final class ProductAdded extends ProductState {}

final class ProductUpdated extends ProductState {}

final class ProductDeleted extends ProductState {}
