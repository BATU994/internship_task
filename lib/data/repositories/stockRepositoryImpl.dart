import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internship_project_itemstorage/core/enums/stockOperation.dart';
import 'package:internship_project_itemstorage/data/models/stock.dart';
import 'package:internship_project_itemstorage/domain/repositories/stockRepository.dart';

class StockRepositoryImpl implements StockRepository {
  late Box<StockModel> _stockBox;

  StockRepositoryImpl(this._stockBox);

  Future<Either<Exception, List<StockModel>>> getStock() async {
    try {
      final stock = _stockBox.values.toList();
      if (stock.isNotEmpty) {
        return Right(stock);
      } else {
        return Right(<StockModel>[]);
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, Unit>> addStock(StockModel stock) async {
    try {
      await _stockBox.put(stock.gtin, stock);
      return Right(unit);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<Either<Exception, Unit>> addAmount(
    String gtin,
    int amount,
    StockOperation operation,
  ) async {
    try {
      final existingStock = _stockBox.get(gtin);
      if (existingStock != null) {
        if (operation == StockOperation.remove &&
            existingStock.quantity > amount) {
          final updatedStock = StockModel(
            warehouse: existingStock.warehouse,
            gtin: existingStock.gtin,
            quantity: existingStock.quantity - amount,
          );
          await _stockBox.put(gtin, updatedStock);
          return Right(unit);
        } else if (operation == StockOperation.remove &&
            existingStock.quantity == amount) {
          await _stockBox.delete(gtin);
          return Right(unit);
        } else if (operation == StockOperation.add) {
          final updatedStock = StockModel(
            warehouse: existingStock.warehouse,
            gtin: existingStock.gtin,
            quantity: existingStock.quantity + amount,
          );
          await _stockBox.put(gtin, updatedStock);
          return Right(unit);
        } else {
          return Left(
            Exception("Insufficient stock to remove the specified amount"),
          );
        }
      } else {
        return Left(Exception("Stock item not found"));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
