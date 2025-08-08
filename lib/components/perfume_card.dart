import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/utils/button3.dart';
import 'package:par_1/utils/colors.dart';
import 'package:provider/provider.dart';

class PerfumeCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final String subtext;
  final bool isCarting;
  final double price;
  const PerfumeCard({
    super.key,
    required this.imagePath,
    required this.text,
    required this.subtext,
    required this.isCarting,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.h,
      width: 170.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.r,
            spreadRadius: 0.4,
            offset: Offset(1.5, 2),
            color: Colors.black38,
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
              fit: BoxFit.cover,
              height: 150.r,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subtext,
                  style: TextStyle(
                    color: subColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'QAR. ${price.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomElevatedButton3(
                      label: 'Add',
                      onPressed: () {
                        final cart = Provider.of<CartProvider>(
                          context,
                          listen: false,
                        );
                        if (isCarting) {
                          cart.clearFragrance(); // deselect
                        } else {
                          cart.setFragrance(
                            text,
                            price,
                          ); // select this fragrance
                        }
                      },
                      isSelected: isCarting,
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
