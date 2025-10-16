import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/bottomNavbar.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/core/getIt/injenction_container.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/productBloc/product_bloc.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/storageBloc/stock_bloc.dart';

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
        BlocProvider(create: (_) => sl<ProductBloc>()..add(LoadProducts())),
        BlocProvider(create: (_) => sl<StockBloc>()..add(LoadStocks())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: const NavBar(),
      ),
    );
  }
}
