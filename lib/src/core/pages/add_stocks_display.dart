import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/core/widgets/custom_elevated_button.dart';
import 'package:internship_project_itemstorage/src/core/widgets/custom_text_field.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/storageBloc/stock_bloc.dart';

class AddStocksDisplay extends StatefulWidget {
  const AddStocksDisplay({super.key});

  @override
  State<AddStocksDisplay> createState() => _AddStocksDisplayState();
}

class _AddStocksDisplayState extends State<AddStocksDisplay> {
  final TextEditingController _gtinController = TextEditingController();
  final TextEditingController _warehoseController = TextEditingController();
  double tempValue = 0;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomTextField(
              controller: _warehoseController,
              label: 'Warehouse name',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Write your warehouse';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: _gtinController,
              label: 'GTIN (13 digits)',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.length < 13 ||
                    !RegExp(r'^\d*$').hasMatch(value) ||
                    value.isEmpty ||
                    value.length > 13) {
                  return 'GTIN should be 13 digits';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            SpinBox(
              incrementIcon: const Icon(Icons.add, color: Colors.white),
              decrementIcon: const Icon(Icons.remove, color: Colors.white),
              textStyle: TextStyle(color: Colors.white),
              min: 0,
              max: double.infinity,
              value: tempValue,
              onChanged: (value) {
                setState(() {
                  tempValue = value;
                });
              },
              step: 10,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              onPressed: () async {
                var box = Hive.box<StockModel>('stockBox');
                if (_formKey.currentState!.validate()) {
                  if (_warehoseController.text.isNotEmpty &&
                      _gtinController.text.isNotEmpty &&
                      tempValue != 0) {
                    if (await Hive.boxExists(_gtinController.text) ||
                        box.values.any(
                          (stock) =>
                              stock.warehouse == _warehoseController.text,
                        )) {
                      final stock = box.get(_gtinController.text);
                      double upQuantity = stock!.quantity + tempValue;
                      BlocProvider.of<StockBloc>(
                        context,
                      ).add(AmountStock(_gtinController.text, upQuantity));
                      _warehoseController.clear();
                      _gtinController.clear();
                      tempValue = 0;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Stock already exists, added quantity'),
                        ),
                      );
                    } else {
                      BlocProvider.of<StockBloc>(context).add(
                        AddStock(
                          StockModel(
                            gtin: _gtinController.text,
                            warehouse: _warehoseController.text,
                            quantity: tempValue,
                          ),
                        ),
                      );
                      _warehoseController.clear();
                      _gtinController.clear();
                      tempValue = 0;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Stock posted')),
                      );
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields and add an image'),
                    ),
                  );
                }
              },
              backColor: primaryColor,
              foreColor: subColor,
              childText: 'Add Product',
            ),
          ],
        ),
      ),
    );
  }
}
