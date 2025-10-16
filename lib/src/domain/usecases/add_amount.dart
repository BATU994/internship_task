import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/stockRepository.dart';

class AddAmountUseCase {
  final StockRepository repository;

  AddAmountUseCase(this.repository);

  Future<Either<Exception, Unit>> call(
    String gtin,
    double newQuantity
  ) async {
    try {
      if (gtin.isNotEmpty && gtin.length == 13) {
        final result = await repository.addAmount(gtin, newQuantity);
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
