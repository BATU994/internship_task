import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/core/widgets/custom_elevated_button.dart';
import 'package:internship_project_itemstorage/src/core/widgets/custom_text_field.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/productBloc/product_bloc.dart';

void showUpdateProductDialog(BuildContext context, ProductModel product) {
  final nameController = TextEditingController(text: product.name);
  final gtinController = TextEditingController(text: product.gtin);
  double price = product.price;
  final ImagePicker picker = ImagePicker();
  String? imageBytes;
  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      imageBytes = base64Encode(bytes);
    }
  }

  showDialog(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Dialog(
          insetPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                color: primaryColor,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Update Product',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: nameController,
                      label: 'Product Name',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'GTIN: ${product.gtin}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    SpinBox(
                      incrementIcon: const Icon(Icons.add, color: Colors.white),
                      decrementIcon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      textStyle: TextStyle(color: Colors.white),
                      min: 0,
                      max: double.infinity,
                      value: price,
                      onChanged: (value) {
                        setState(() {
                          price = value;
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
                    const SizedBox(height: 16),

                    GestureDetector(
                      onTap: pickImage,
                      child: imageBytes == null
                          ? Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey[200],
                              ),
                              child: const Icon(Icons.camera_alt, size: 40),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.memory(
                                base64Decode(imageBytes!),
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              childText: 'Cancel',
                              backColor: Colors.grey,
                              foreColor: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomElevatedButton(
                              onPressed: () {
                                final updated = ProductModel(
                                  name: nameController.text,
                                  gtin: gtinController.text,
                                  price: price,
                                  createdAt: product.createdAt,
                                  updatedAt: DateTime.now(),
                                  imagePath: imageBytes,
                                );
                                context.read<ProductBloc>().add(
                                  UpdateProduct(updated),
                                );
                                Navigator.pop(context);
                              },
                              backColor: Colors.blue,
                              foreColor: Colors.white,
                              childText: 'Save',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
