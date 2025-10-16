import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/core/widgets/custom_elevated_button.dart';
import 'package:internship_project_itemstorage/src/core/widgets/custom_text_field.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/presentation/blocs/productBloc/product_bloc.dart';

class AddProductsDisplay extends StatefulWidget {
  const AddProductsDisplay({super.key});

  @override
  State<AddProductsDisplay> createState() => _AddProductsDisplayState();
}

class _AddProductsDisplayState extends State<AddProductsDisplay> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gtinController = TextEditingController();
  double tempValue = 0;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  String? _imageBytes;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _imageBytes = base64Encode(bytes);
      });
    }
  }

  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product added successfully')),
          );
          nameController.clear();
          gtinController.clear();
          tempValue = 0;
          setState(() {
            _imageBytes = null;
          });
        } else if (state is ProductError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: _imageBytes == null
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
                            base64Decode(_imageBytes!),
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: nameController,
                  label: 'Product Name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Write the name';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  controller: gtinController,
                  label: 'GTIN (13 digits)',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.length < 13 ||
                        !RegExp(r'^\d*$').hasMatch(value) ||
                        value.isEmpty) {
                      return 'GTIN should be 13 digits';
                    } else {
                      return null;
                    }
                  },
                ),
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
                const SizedBox(height: 20),
                CustomElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (nameController.text.isNotEmpty &&
                          gtinController.text.isNotEmpty &&
                          tempValue != 0 &&
                          _imageBytes != null) {
                        BlocProvider.of<ProductBloc>(context).add(
                          AddProduct(
                            ProductModel(
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              name: nameController.text,
                              gtin: gtinController.text,
                              price: tempValue,
                              isDeleted: false,
                              imagePath: _imageBytes,
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please fill all fields and add an image',
                          ),
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
      },
    );
  }
}
