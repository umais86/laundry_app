import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button3.dart';
import 'package:par_1/utils/colors.dart';

class OurServiceCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final String subText;
  final double price;
  final bool iscarting;

  const OurServiceCard({
    super.key,
    required this.imagePath,
    required this.iscarting,
    required this.text,
    required this.subText,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 170.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.r,
            blurRadius: 0.4.r,
            color: Colors.black12,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16.r),
            child: Image.asset(
              imagePath,
              height: 119.h,
              width: double.infinity,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            child: Column(
              children: [
                Text(subText, style: TextStyle(fontSize: 11.sp)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'QAR ${price.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: txtColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                      ),
                    ),
                    CustomElevatedButton3(
                      label: 'Add',
                      onPressed: () {},
                      isSelected: iscarting,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
