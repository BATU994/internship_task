import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/productRepository.dart';

class AddProductUseCase {
  final ProductRepository repository;
  AddProductUseCase(this.repository);
  Future<Either<Exception, Unit>> call(ProductModel product) async {
    try {
      final result = await repository.addProduct(product);
      if (result.isRight()) {
        return Right(unit);
      } else {
        return Left(Exception('Failed to add product'));
      }
    } catch (e) {
      return Left(Exception('Failed to add product'));
    }
  }
}
