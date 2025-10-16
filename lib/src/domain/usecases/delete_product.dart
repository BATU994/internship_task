import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/productRepository.dart';

class DeleteProductUseCase {
  final ProductRepository repository;
  DeleteProductUseCase(this.repository);

  Future<Either<Exception, Unit>> call(String gtin) async {
    try {
      final result = await repository.deleteProduct(gtin);
      if (result.isRight()) {
        return Right(unit);
      } else {
        return Left(Exception('Failed to delete product'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
