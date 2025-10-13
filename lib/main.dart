import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internship_project_itemstorage/bottomNavbar.dart';
import 'package:internship_project_itemstorage/core/getIt/injenction_container.dart';
import 'package:internship_project_itemstorage/data/models/product.dart';
import 'package:internship_project_itemstorage/data/repositories/productRepositoryImpl.dart';
import 'package:internship_project_itemstorage/data/repositories/stockRepositoryImpl.dart';
import 'package:internship_project_itemstorage/domain/usecases/add_product.dart';
import 'package:internship_project_itemstorage/domain/usecases/delete_product.dart';
import 'package:internship_project_itemstorage/domain/usecases/get_products.dart';
import 'package:internship_project_itemstorage/domain/usecases/update_product.dart';
import 'package:internship_project_itemstorage/presentation/blocs/productBloc/product_bloc.dart';
import 'package:internship_project_itemstorage/presentation/blocs/storageBloc/stock_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductBloc>()..add(LoadProducts()),
        ),
        BlocProvider(create: (context) => sl<StockBloc>()..add(LoadStocks())),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: const Color.fromARGB(255, 36, 36, 36),
        ),
        home: const NavBar(),
      ),
    );
  }
}
