part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class LoadProducts extends ProductEvent {}

final class AddProduct extends ProductEvent {
  final ProductModel product;
  AddProduct(this.product);
}

final class UpdateProduct extends ProductEvent {
  final ProductModel product;
  UpdateProduct(this.product);
}

final class DeleteProduct extends ProductEvent {
  final String gtin;
  DeleteProduct(this.gtin);
}
