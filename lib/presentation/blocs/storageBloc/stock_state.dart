part of 'stock_bloc.dart';

@immutable
sealed class StockState {}

final class StockInitial extends StockState {}

final class StockLoading extends StockState {}

final class StockLoaded extends StockState {
  final List<StockModel> stocks;
  StockLoaded(this.stocks);
}

final class StockError extends StockState {
  final String message;
  StockError(this.message);
}

final class StockEmpty extends StockState {}
