import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/stockRepository.dart';

class StockRepositoryImpl implements StockRepository {
  late final Box<StockModel> _stockBox;
  late final Box<ProductModel> _productBox;
  StockRepositoryImpl(this._stockBox, this._productBox);
  @override
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

  @override
  Future<Either<Exception, Unit>> addStock(StockModel stock) async {
    try {
      await _stockBox.put(stock.gtin, stock);
      return Right(unit);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Unit>> addAmount(
    String gtin,
    double newQuantity,
  ) async {
    try {
      final stock = _stockBox.get(gtin);
      if (stock != null) {
        final updatedStock = StockModel(
          warehouse: stock.warehouse,
          gtin: stock.gtin,
          quantity: newQuantity,
        );
        await _stockBox.put(gtin, updatedStock);
        return Right(unit);
      } else {
        return Left(Exception("Stock item not found"));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<ProductModel>>> getNames() async {
    try {
      final List<ProductModel> products = [];

      for (var stock in _stockBox.values) {
        final matches = _productBox.values.where((p) => p.gtin == stock.gtin);
        if (matches.isNotEmpty) {
          products.add(matches.first);
        }
      }
      return Right(products);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
