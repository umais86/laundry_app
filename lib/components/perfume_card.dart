// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:par_1/utils/button2.dart';
import 'package:par_1/utils/colors.dart';

class PerfumeCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final String subtext;
  final bool isCarting;
 const PerfumeCard({
    super.key,
    required this.imagePath,
    required this.text,
    required this.subtext,
    required this.isCarting,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(blurRadius: 10.r, spreadRadius: 2, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 80,
            width: double.infinity,
          ),
          SizedBox(height: 10.h),
          Text(
            text,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h),
          Text(
            subtext,
            style: TextStyle(color: subColor, fontSize: 14.sp),
          ),
          CustomElevatedButton2(label: 'Add', onPressed: (){}, isSelected: )
        ],
      ),
    );
  }
}
