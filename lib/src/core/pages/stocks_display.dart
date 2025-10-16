import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/src/core/modals/show_changeQuan_stock_dialog.dart';
import 'package:internship_project_itemstorage/src/core/widgets/stocks_tile.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/productBloc/product_bloc.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/storageBloc/stock_bloc.dart';

class StocksDisplay extends StatelessWidget {
  const StocksDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is LoadStocks) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StockLoaded) {
          final stocks = state.stocks;
          final products = state.matchedProducts;
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 4),
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              final stock = stocks[index];
              final product = products.firstWhere(
                (p) => p.gtin == stock.gtin,
                orElse: () => ProductModel(
                  name: 'Product (Not found)',
                  gtin: stock.gtin,
                  price: 0,
                  createdAt: DateTime(1),
                ),
              );
              return StocksTile(
                matched: product,
                itemModel: stock,
                onEdit: () {
                  showChangeStockDialog(context, stock);
                },
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text('Error'));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
