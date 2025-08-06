import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/appbar_icon/star_rating.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class Testinomial extends StatelessWidget {
  const Testinomial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 22),
            ),
            SizedBox(height: 2.h),
            Center(
              child: Column(
                children: [
                  Text(
                    ' Loved by Doha’s Finest',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    ' Hear what our elite clients say about the \nAkoya experience.',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Text(
                    'Reviews:',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  StarRating(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
