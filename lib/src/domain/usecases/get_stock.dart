import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/stockRepository.dart';

class GetStockUseCase {
  final StockRepository repository;
  GetStockUseCase(this.repository);

  Future<Either<Exception, List<StockModel>>> call() async {
    try {
      final result = await repository.getStock();
      if (result.isRight()) {
        final items = result.getOrElse(() => []);
        return Right(items);
      } else {
        return Left(Exception('Failed to get stock'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
