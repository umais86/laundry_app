import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';

class Card2 extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget icon;
  final List<String> features;

  const Card2({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFF0C341);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 180.h,
        width: 165.w,
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x33000000),
              blurRadius: 10.r,
              spreadRadius: 1.r,
              offset: Offset(3.w, 5.h),
            ),
          ],
          border: Border(
            top: BorderSide(color: gold, width: 4.w),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: icon),
            SizedBox(height: 6.h),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: gold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.h),
            ...features.map((feature) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.circle, size: 8.r, color: gold),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: txtColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
