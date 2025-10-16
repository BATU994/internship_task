import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/core/pages/add_products_display.dart';
import 'package:internship_project_itemstorage/src/core/pages/add_stocks_display.dart';
import 'package:internship_project_itemstorage/src/core/widgets/filter_picker.dart';

class AddModels extends StatefulWidget {
  const AddModels({super.key});

  @override
  State<AddModels> createState() => _AddModelsState();
}

class _AddModelsState extends State<AddModels> {
  FilterType selected = FilterType.products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: subColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(
            children: [
              SizedBox(height: 8),
              FilterPicker(
                onChanged: (filter) {
                  setState(() {
                    selected = filter;
                  });
                },
              ),
              selected == FilterType.products
                  ? AddProductsDisplay()
                  : AddStocksDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
