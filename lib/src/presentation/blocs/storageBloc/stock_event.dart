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
  final double newQuantity;
  AmountStock(this.gtin, this.newQuantity);
}

class DeleteStock extends StockEvent {
  final String id;
  DeleteStock(this.id);
}
