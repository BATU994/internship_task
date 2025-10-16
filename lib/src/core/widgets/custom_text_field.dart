import 'package:flutter/material.dart';
import 'package:internship_project_itemstorage/src/core/constants/colors/mainColors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String label;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: validator,
          style: TextStyle(color: Colors.white),
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey.shade600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: subColor),
            ),
          ),
          keyboardType: keyboardType,
        ),
        SizedBox(height: 20),
        
      ],
    );
  }
}
