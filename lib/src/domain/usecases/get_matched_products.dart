import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/stockRepository.dart';

class GetMatchedProductsUseCase {
  final StockRepository repository;
  GetMatchedProductsUseCase(this.repository);

  Future<Either<Exception, List<ProductModel>>> call() async {
    try {
      final result = await repository.getNames();
      if (result.isRight()) {
        final products = result.getOrElse(() => []);
        return Right(products);
      } else {
        return Left(Exception('Failed to get matches'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}