import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/data/models/stock.dart';
import 'package:internship_project_itemstorage/presentation/blocs/storageBloc/stock_bloc.dart';

void showChangeStockDialog(BuildContext context, StockModel stock) {
  double tempValue = stock.quantity.toDouble(); // initial value from model

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Change Stock Quantity'),
        content: SpinBox(
          min: 0,
          max: 9999,
          value: tempValue,
          step: 1,
          spacing: 20,
          onChanged: (value) => tempValue = value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Quantity',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Trigger BLoC event to update stock
              BlocProvider.of<StockBloc>(context).add(
                AmountStock(stock.gtin, , operation)
              );
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
