import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/data/models/product.dart';
import 'package:internship_project_itemstorage/presentation/blocs/productBloc/product_bloc.dart';

void showUpdateProductDialog(BuildContext context, ProductModel product) {
  final nameController = TextEditingController(text: product.name);
  final gtinController = TextEditingController(text: product.gtin);
  final priceController = TextEditingController(text: product.price.toString());

  String? imageBase64 = product.imagePath;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final bytes = await File(picked.path).readAsBytes();
      imageBase64 = base64Encode(bytes);
    }
  }

  showDialog(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Update Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Product Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: gtinController,
                        decoration: const InputDecoration(
                          labelText: 'GTIN',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (imageBase64 != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            base64Decode(imageBase64!),
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      TextButton.icon(
                        onPressed: () async {
                          await pickImage();
                          setState(() {}); // refresh preview
                        },
                        icon: const Icon(Icons.image),
                        label: const Text('Change Image'),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              final updated = ProductModel(
                                name: nameController.text,
                                gtin: gtinController.text,
                                price:
                                    double.tryParse(priceController.text) ??
                                    0.0,
                                createdAt: product.createdAt,
                                updatedAt: DateTime.now(),
                                imagePath: imageBase64,
                              );

                              context.read<ProductBloc>().add(
                                UpdateProduct(updated),
                              );

                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
