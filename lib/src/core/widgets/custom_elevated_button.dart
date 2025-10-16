import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.backColor,
    required this.foreColor,
    required this.childText,
  });
  final VoidCallback onPressed;
  final Color backColor;
  final Color foreColor;
  final String childText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          foregroundColor: foreColor,
        ),
        onPressed: onPressed,
        child: Text(childText),
      ),
    );
  }
}
