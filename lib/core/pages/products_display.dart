import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/core/functions/show_delete_product_dialog.dart';
import 'package:internship_project_itemstorage/core/functions/show_update_product_dialog.dart';
import 'package:internship_project_itemstorage/core/getIt/injenction_container.dart';
import 'package:internship_project_itemstorage/core/widgets/product_tile.dart';
import 'package:internship_project_itemstorage/presentation/blocs/productBloc/product_bloc.dart';

class ProductsDisplay extends StatelessWidget {
  const ProductsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final products = state.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductTile(
                itemModel: product,
                onEdit: () {
                  showUpdateProductDialog(context, product);
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
