import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/storageBloc/stock_bloc.dart';

void showChangeStockDialog(BuildContext context, StockModel stock) {
  double tempValue = stock.quantity.toDouble();
  double addOnValue = 0;
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Change Stock Quantity'),
        content: SizedBox(
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinBox(
                min: -double.infinity,
                max: double.infinity,
                value: tempValue,
                step: 1,
                spacing: 20,
                onChanged: (value) => tempValue = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantity',
                ),
              ),
              SizedBox(height: 10),
              SpinBox(
                min: -double.infinity,
                max: double.infinity,
                step: 1,
                spacing: 20,
                onChanged: (value) => addOnValue = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add on quantity',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<StockBloc>(
                context,
              ).add(AmountStock(stock.gtin, tempValue + addOnValue));
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}
