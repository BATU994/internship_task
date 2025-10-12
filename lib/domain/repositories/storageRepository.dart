import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/data/models/storage.dart';

abstract interface class StorageRepository{
  Future<Either<Exception, List<StockModel>>> getStock();
  Future<Either<Exception, Unit>> addStock(StockModel stock);
  Future<Either<Exception, Unit>> addAmount(String gtin);
}