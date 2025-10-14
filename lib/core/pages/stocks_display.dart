import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/core/functions/show_delete_product_dialog.dart';
import 'package:internship_project_itemstorage/core/functions/show_update_product_dialog.dart';
import 'package:internship_project_itemstorage/core/getIt/injenction_container.dart';
import 'package:internship_project_itemstorage/core/widgets/product_tile.dart';
import 'package:internship_project_itemstorage/core/widgets/stocks_tile.dart';
import 'package:internship_project_itemstorage/presentation/blocs/productBloc/product_bloc.dart';
import 'package:internship_project_itemstorage/presentation/blocs/storageBloc/stock_bloc.dart';

class StocksDisplay extends StatelessWidget {
  const StocksDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is LoadStocks) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StockLoaded) {
          final stocks = state.stocks;
          return ListView.builder(
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              final stock = stocks[index];
              return StocksTile(
                itemModel: stock,
                onEdit: () {
                  showUpdateProductDialog(context, stock);
                },
                onDelete: () {
                  showDeleteProductDialog(context, product.gtin);
                },
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
