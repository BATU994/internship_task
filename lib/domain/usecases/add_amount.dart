import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/core/enums/stockOperation.dart';
import 'package:internship_project_itemstorage/domain/repositories/stockRepository.dart';

class AddAmountUseCase {
  final StockRepository repository;

  AddAmountUseCase(this.repository);

  Future<Either<Exception, Unit>> call(
    String gtin,
    int amount,
    StockOperation operation,
  ) async {
    try {
      if (gtin.isNotEmpty && gtin.length == 13) {
        final result = await repository.addAmount(gtin, amount, operation);
        if (result.isRight()) {
          return Right(unit);
        } else {
          return Left(Exception("Failed to add amount"));
        }
      } else {
        return Left(Exception("Invalid GTIN format"));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
