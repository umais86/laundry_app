import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/view/cloth_screen.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class Fragrance extends StatefulWidget {
  const Fragrance({super.key});

  @override
  State<Fragrance> createState() => _FragranceState();
}

class _FragranceState extends State<Fragrance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, size: 25.r, color: Colors.black),
                ),
                Text(
                  'Select Fragrance',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Spacer(),
            CustomElevatedButton(
              label: "Confirm & Continue",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ClothScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
