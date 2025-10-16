import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/productRepository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Exception, List<ProductModel>>> call() async {
    try {
      final result = await repository.getProduct();
      if (result.isRight()) {
        final items = result.getOrElse(() => []);
        return Right(items);
      } else {
        return Left(Exception('Failed to delete product'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
