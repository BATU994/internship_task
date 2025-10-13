import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internship_project_itemstorage/data/models/product.dart';
import 'package:internship_project_itemstorage/data/models/stock.dart';
import 'package:internship_project_itemstorage/data/repositories/productRepositoryImpl.dart';
import 'package:internship_project_itemstorage/data/repositories/stockRepositoryImpl.dart';
import 'package:internship_project_itemstorage/domain/repositories/productRepository.dart';
import 'package:internship_project_itemstorage/domain/repositories/stockRepository.dart';
import 'package:internship_project_itemstorage/domain/usecases/add_amount.dart';
import 'package:internship_project_itemstorage/domain/usecases/add_product.dart';
import 'package:internship_project_itemstorage/domain/usecases/add_stock.dart';
import 'package:internship_project_itemstorage/domain/usecases/delete_product.dart';
import 'package:internship_project_itemstorage/domain/usecases/get_products.dart';
import 'package:internship_project_itemstorage/domain/usecases/get_stock.dart';
import 'package:internship_project_itemstorage/domain/usecases/update_product.dart';
import 'package:internship_project_itemstorage/presentation/blocs/productBloc/product_bloc.dart';
import 'package:internship_project_itemstorage/presentation/blocs/storageBloc/stock_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Initialize Hive once
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(StockModelAdapter());

  // ✅ Open all boxes here once
  final productBox = await Hive.openBox<ProductModel>('productsBox');
  final stockBox = await Hive.openBox<StockModel>('stockBox');

  // ✅ Create repository implementations with already opened boxes
  final productRep = ProductRepositoryImpl(productBox);
  final stockRep = StockRepositoryImpl(stockBox);

  // Register repositories
  sl.registerLazySingleton<ProductRepository>(() => productRep);
  sl.registerLazySingleton<StockRepository>(() => stockRep);

  // Register usecases
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton(() => AddProductUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProductUseCase(sl()));
  sl.registerLazySingleton(() => DeleteProductUseCase(sl()));
  sl.registerLazySingleton(() => GetStockUseCase(sl()));
  sl.registerLazySingleton(() => AddAmountUseCase(sl()));
  sl.registerLazySingleton(() => AddStockUseCase(repository: sl()));

  // Register blocs
  sl.registerFactory(
    () => ProductBloc(
      sl<AddProductUseCase>(),
      sl<GetProductsUseCase>(),
      sl<UpdateProductUseCase>(),
      sl<DeleteProductUseCase>(),
    ),
  );

  sl.registerFactory(
    () => StockBloc(
      sl<AddStockUseCase>(),
      sl<GetStockUseCase>(),
      sl<AddAmountUseCase>(),
    ),
  );
}
