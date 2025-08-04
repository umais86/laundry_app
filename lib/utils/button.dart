import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 45.h),
        backgroundColor: color ?? primaryColor,
        foregroundColor: textColor ?? white,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: textColor ?? white, fontSize: 16.sp),
      ),
    );
  }
}
