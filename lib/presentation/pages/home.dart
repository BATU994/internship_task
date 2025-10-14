import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/core/pages/products_display.dart';
import 'package:internship_project_itemstorage/core/pages/stocks_display.dart';
import 'package:internship_project_itemstorage/core/widgets/filter_picker.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FilterPicker(
                onChanged: (filter) {
                  setState(() {
                    selected = filter;
                  });
                },
              ),
              SizedBox(height: 10),
              if (selected == FilterType.products)
                ProductsDisplay()
              else
                StocksDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
