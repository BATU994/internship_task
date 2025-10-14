import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/core/widgets/filter_picker.dart';

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
      appBar: AppBar(title: const Text('Add')),
      body: Column(
        children: [
          FilterPicker(
            onChanged: (filter) {
              setState(() {
                selected = filter;
              });
            },
          ),
        ],
      ),
    );
  }
}
