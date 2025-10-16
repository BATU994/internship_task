import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';

class ProductTile extends StatelessWidget {
  final ProductModel itemModel;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductTile({
    super.key,
    required this.itemModel,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: itemModel.imagePath != null
                  ? Image.memory(
                      base64Decode(itemModel.imagePath!),
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: subColor,
                      child: const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemModel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: subColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'GTIN: ${itemModel.gtin}',
                    style: TextStyle(fontSize: 12, color: subColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${itemModel.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: subColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: onEdit,
                              icon: const Icon(
                                Icons.edit,
                                size: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: onDelete,
                              icon: const Icon(
                                Icons.delete,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
