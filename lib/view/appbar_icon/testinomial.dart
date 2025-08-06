import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/star_rating_card.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 22.r),
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
            SizedBox(height: 16.h),
            StarRatingCard(
              imagePath: 'assets/images/pic.png',
              text: "Sheikha Al-Thani",
              text2: 'UI Designer',
              text3: '3.0',
              text4:
                  "Akoya's attention to detail is unmatched.The only service I trust with my collection.",
            ),

            SizedBox(height: 8.h),
            StarRatingCard(
              imagePath: 'assets/images/pic 2.png',
              text: "Mr. Khalid Al-Mansoori",
              text2: 'Executive Director',
              text3: '4.0',
              text4:
                  "As someone who wears bespoke suits daily, Akoya's executive service saves hours each week.",
            ),
            SizedBox(height: 8.h),
            StarRatingCard(
              imagePath: 'assets/images/pic 3.png',
              text: "Mrs. Eleanor Rutherford",
              text2: "Diplomat's Wife",
              text3: '5.0',
              text4:
                  "The fragrance infusion option is divine. My clothes return smelling like a Parisian boutique.",
            ),
          ],
        ),
      ),
    );
  }
}
