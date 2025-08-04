import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class HowItWork extends StatelessWidget {
  const HowItWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 22.sp),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'How It Work',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'From pickup to doorstep delivery, here’s \nhow Akoya makes it seamless.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _containerRow(
              'assets/icons/locate.png',
              'Schedule Pickup',
              'Choose time & location\nthat suits you.',
            ),
            SizedBox(height: 8.h),
            _containerRow(
              'assets/icons/garments.png',
              'Garments Collected',
              'Our team collects, your \nlaundry with care.',
            ),
            SizedBox(height: 8.h),
            _containerRow(
              'assets/icons/drop.png',
              'Custom Wash & Treatment',
              'Fragrance , Steam packaging \nyour way.',
            ),
            SizedBox(height: 8.h),
            _containerRow(
              'assets/icons/home1.png',
              'Delivered To Your Door',
              'We deliver fresh, clean \ngarments on time.',
            ),
            SizedBox(height: 30.h),
            CustomElevatedButton(label: 'Schedule a pickup', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _containerRow(String iconPath, String title, String text) {
    return Container(
      height: 90.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(offset: Offset(1.w, 1.h), color: Colors.grey.shade50),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              height: 40.h,
              width: 40.w,
              color: Colors.black,
            ),
            SizedBox(width: 36.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
