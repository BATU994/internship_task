import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/productRepository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Box<ProductModel> _productBox;

  ProductRepositoryImpl(this._productBox);
  
  @override
  Future<Either<Exception, Unit>> addProduct(ProductModel product) async {
    try {
      _productBox.put(product.gtin, product);
      return Right(unit);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Unit>> updateProduct(
    ProductModel updatedProduct,
  ) async {
    try {
      _productBox.put(updatedProduct.gtin, updatedProduct);
      return Right(unit);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override  Future<Either<Exception, Unit>> deleteProduct(String gtin) async {
    try {
      await _productBox.delete(gtin);
      return Right(unit);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<ProductModel>>> getProduct() async {
    try {
      final products = _productBox.values.toList();
      if (products.isNotEmpty) {
        return Right(products);
      } else {
        return Right(<ProductModel>[]);
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
