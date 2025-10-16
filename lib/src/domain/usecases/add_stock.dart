import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/stockRepository.dart';

class AddStockUseCase {
  final StockRepository repository;
  AddStockUseCase({required this.repository});
  Future<Either<Exception, Unit>> call(StockModel stock) async {
    try {
      final result = await repository.addStock(stock);
      if (result.isRight()) {
        return Right(unit);
      } else {
        return Left(Exception('Failed to add items'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
