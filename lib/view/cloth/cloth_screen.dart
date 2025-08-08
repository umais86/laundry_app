import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button2.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';
import 'package:par_1/widgets/men_cloth_list.dart';
import 'package:par_1/widgets/women_cloth_list.dart';

class ClothScreen extends StatefulWidget {
  const ClothScreen({super.key});

  @override
  State<ClothScreen> createState() => _ClothScreenState();
}

class _ClothScreenState extends State<ClothScreen> {
  bool isMenSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  'Select Your Cloth',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                'What clothes are you \nsending us?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: Text(
                'Tell us which garments you’d like us to care for. Add \neach item with the quantity so we can prepare \nthem perfectly.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton2(
                  label: 'Men’s',
                  isSelected: isMenSelected,
                  onPressed: () => setState(() => isMenSelected = true),
                ),
                SizedBox(width: 40.w),
                CustomElevatedButton2(
                  label: 'Women’s',
                  isSelected: !isMenSelected,
                  onPressed: () => setState(() => isMenSelected = false),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(child: isMenSelected ? MenClothList() : WomenClothList()),
          ],
        ),
      ),
    );
  }
}
