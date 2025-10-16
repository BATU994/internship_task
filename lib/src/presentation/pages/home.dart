import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/core/pages/products_display.dart';
import 'package:internship_project_itemstorage/src/core/pages/stocks_display.dart';
import 'package:internship_project_itemstorage/src/core/widgets/filter_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilterType selected = FilterType.products;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: subColor,
      ),
      body: Padding(
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
            SizedBox(height: 10),
            if (selected == FilterType.products)
              Expanded(child: ProductsDisplay())
            else
              Expanded(child: StocksDisplay()),
          ],
        ),
      ),
    );
  }
}
