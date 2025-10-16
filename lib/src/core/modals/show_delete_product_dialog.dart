import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/src/core/widgets/custom_elevated_button.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/productBloc/product_bloc.dart';

void showDeleteProductDialog(BuildContext context, String gtin) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Are you sure to delete product?'),
            const SizedBox(height: 20),
            Icon(Icons.delete, color: Colors.red, size: 50),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      childText: 'Close',
                      backColor: Colors.grey,
                      foreColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomElevatedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(DeleteProduct(gtin));
                        Navigator.pop(context);
                      },
                      childText: 'Delete',
                      backColor: Colors.red,
                      foreColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
