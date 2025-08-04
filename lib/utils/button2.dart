import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';

class CustomElevatedButton2 extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomElevatedButton2({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSelected,
    this.borderRadius = 12,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(139.w, 40.h),
        backgroundColor: isSelected ? primaryColor : white,
        foregroundColor: isSelected ? white : Colors.black,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          side: BorderSide.none,
        ),
        elevation: isSelected ? 2 : 1,
      ),
      onPressed: onPressed,
      child: Text(label, style: TextStyle(fontSize: 14.sp)),
    );
  }
}
