import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';
import 'package:internship_project_itemstorage/src/data/models/product.dart';
import 'package:internship_project_itemstorage/src/data/models/stock.dart';

class StocksTile extends StatelessWidget {
  const StocksTile({
    super.key,
    required this.itemModel,
    required this.onEdit,
    required this.matched,
  });

  final StockModel itemModel;
  final ProductModel matched;
  final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 8,
                right: 8,
                child: IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    size: 30,
                    Icons.add_circle_outline_sharp,
                    color: Colors.blue,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${matched.name} - ${itemModel.warehouse}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: subColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'GTIN:  ${itemModel.gtin}',
                            style: TextStyle(
                              fontSize: 13,
                              color: subColor,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      "Quantity: ${itemModel.quantity}",
                      style: TextStyle(
                        fontSize: 13,
                        color: subColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
