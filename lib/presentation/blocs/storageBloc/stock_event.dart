part of 'stock_bloc.dart';

@immutable
sealed class StockEvent {}

class LoadStocks extends StockEvent {}

class AddStock extends StockEvent {
  final StockModel stock;
  AddStock(this.stock);
}

class AmountStock extends StockEvent {
  final String gtin;
  final StockOperation operation;
  final int amount;
  AmountStock(this.gtin, this.amount, this.operation);
}

class DeleteStock extends StockEvent {
  final String id;
  DeleteStock(this.id);
}
