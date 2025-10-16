part of 'stock_bloc.dart';

@immutable
sealed class StockState {}

final class StockInitial extends StockState {}

final class StockLoading extends StockState {}

final class StockLoaded extends StockState {
  final List<StockModel> stocks;
  final List<ProductModel> matchedProducts;
  StockLoaded(this.stocks, this.matchedProducts);
}

final class StockError extends StockState {
  final String message;
  StockError(this.message);
}

final class StockEmpty extends StockState {}
