import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';

abstract interface class StockRepository {
  Future<Either<Exception, List<StockModel>>> getStock();
  Future<Either<Exception, Unit>> addStock(StockModel stock);
  Future<Either<Exception, Unit>> addAmount(
    String gtin,
    double newQuantity
  );
  Future<Either<Exception, List<ProductModel>>> getNames();
}
