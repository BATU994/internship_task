import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/core/constants/colors/mainColors.dart';

enum FilterType { products, stocks }

class FilterPicker extends StatefulWidget {
  final ValueChanged<FilterType>? onChanged;

  const FilterPicker({super.key, this.onChanged});

  @override
  State<FilterPicker> createState() => _FilterPickerState();
}

class _FilterPickerState extends State<FilterPicker> {
  FilterType selectedFilter = FilterType.products;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color.fromRGBO(47, 47, 47, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildFilterButton('Products', FilterType.products),
          const SizedBox(width: 4),
          _buildFilterButton('Stocks', FilterType.stocks),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, FilterType filter) {
    final isSelected = selectedFilter == filter;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = filter;
          });
          if (widget.onChanged != null) widget.onChanged!(filter);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: isSelected ? subColor : primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? textColor
                    : textColor.withValues().withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
