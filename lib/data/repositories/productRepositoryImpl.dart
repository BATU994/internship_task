import 'package:dartz/dartz.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internship_project_itemstorage/data/models/product.dart';
import 'package:internship_project_itemstorage/domain/repositories/productRepository.dart';

class ProductRepositoryImpl implements ProductRepository {
  late Box<ProductModel> _productBox;

  Future<void> init() async {
    if (!Hive.isBoxOpen('productsBox')) {
      _productBox = await Hive.openBox<ProductModel>('productsBox');
    } else {
      _productBox = Hive.box<ProductModel>('productsBox');
    }
  }

  Future<Either<Exception, Unit>> addProduct(ProductModel product) async {
    try {
      _productBox.put(product.gtin, product);
      return Right(unit);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

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

  Future<Either<Exception, Unit>> deleteProduct(String gtin) async {
    try {
      await _productBox.delete(gtin);
      return Right(unit);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

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
