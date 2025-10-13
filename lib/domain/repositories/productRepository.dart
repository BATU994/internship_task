import 'package:dartz/dartz.dart';
import 'package:internship_project_itemstorage/data/models/product.dart';

abstract interface class ProductRepository {
  Future<Either<Exception, Unit>> addProduct(ProductModel product);
  Future<Either<Exception, Unit>> updateProduct(ProductModel product);
  Future<Either<Exception, Unit>> deleteProduct(String gtin);
  Future<Either<Exception, List<ProductModel>>> getProduct();
}
