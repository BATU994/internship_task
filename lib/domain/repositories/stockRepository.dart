import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/core/enums/stockOperation.dart';
import 'package:internship_project_itemstorage/data/models/stock.dart';

abstract interface class StockRepository {
  Future<Either<Exception, List<StockModel>>> getStock();
  Future<Either<Exception, Unit>> addStock(StockModel stock);
  Future<Either<Exception, Unit>> addAmount(
    String gtin,
    int amount,
    StockOperation operation,
  );
}
