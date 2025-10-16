import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';
import 'package:internship_project_itemstorage/src/data/repositories/productRepositoryImpl.dart';
import 'package:internship_project_itemstorage/src/data/repositories/stockRepositoryImpl.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/productRepository.dart';
import 'package:internship_project_itemstorage/src/domain/repositories/stockRepository.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/add_amount.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/add_product.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/add_stock.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/delete_product.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/get_matched_products.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/get_products.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/get_stock.dart';
import 'package:internship_project_itemstorage/src/domain/usecases/update_product.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/productBloc/product_bloc.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/storageBloc/stock_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(StockModelAdapter());

  final productBox = await Hive.openBox<ProductModel>('productsBox');
  final stockBox = await Hive.openBox<StockModel>('stockBox');

  final productRep = ProductRepositoryImpl(productBox);
  final stockRep = StockRepositoryImpl(stockBox, productBox);

  sl.registerLazySingleton<ProductRepository>(() => productRep);
  sl.registerLazySingleton<StockRepository>(() => stockRep);

  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetMatchedProductsUseCase(sl()));
  sl.registerLazySingleton(() => AddProductUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProductUseCase(sl()));
  sl.registerLazySingleton(() => DeleteProductUseCase(sl()));
  sl.registerLazySingleton(() => GetStockUseCase(sl()));
  sl.registerLazySingleton(() => AddAmountUseCase(sl()));
  sl.registerLazySingleton(() => AddStockUseCase(repository: sl()));

  sl.registerFactory(
    () => ProductBloc(
      sl<AddProductUseCase>(),
      sl<GetProductsUseCase>(),
      sl<UpdateProductUseCase>(),
      sl<DeleteProductUseCase>(),
      sl()
    ),
  );

  sl.registerFactory(
    () => StockBloc(
      sl<AddStockUseCase>(),
      sl<GetStockUseCase>(),
      sl<AddAmountUseCase>(),
      sl<GetMatchedProductsUseCase>()
    ),
  );
}