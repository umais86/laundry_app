import 'package:flutter/material.dart';
import 'package:par_1/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 48),
        backgroundColor: color ?? primaryColor,
        foregroundColor: textColor ?? Colors.white,
        padding: padding,
      ),
      onPressed: onPressed,
      child: Text(label, style: TextStyle(color: textColor ?? Colors.white)),
    );
  }
}
