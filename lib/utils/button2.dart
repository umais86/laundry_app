import 'package:flutter/material.dart';
import 'package:par_1/utils/colors.dart';

class CustomElevatedButton2 extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomElevatedButton2({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.borderRadius = 12,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(139, 40),
        backgroundColor: isSelected ? primaryColor : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),

          side: BorderSide.none,
        ),
        elevation: isSelected ? 2 : 1,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
