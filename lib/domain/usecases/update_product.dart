import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/data/models/product.dart';
import 'package:internship_project_itemstorage/domain/repositories/productRepository.dart';

class UpdateProductUseCase {
  final ProductRepository repository;
  UpdateProductUseCase(this.repository);

  Future<Either<Exception, Unit>> call(ProductModel product) async {
    try {
      final result = await repository.updateProduct(product);
      if (result.isRight()) {
        return Right(unit);
      } else {
        return Left(Exception('Failed to update product'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
