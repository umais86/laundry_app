import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/card2.dart';
import 'package:par_1/components/card4.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/view/fragrance.dart';
import 'package:par_1/widgets/custom_app_bar1.dart';

class WashTypeScreen extends StatefulWidget {
  const WashTypeScreen({super.key});

  @override
  State<WashTypeScreen> createState() => _WashTypeScreenState();
}

class _WashTypeScreenState extends State<WashTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        color: white,
        color1: txtColor1,
        color2: txtColor1,
        color3: white,
        color4: white,
        color5: txtColor,
        color6: white,
        color7: white,
        color8: txtColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'How would you like us to clean \nyour garments?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Choose the cleaning style that best fits your \nneeds — standard care or express service.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Card2(
                    onTap: () {},
                    title: 'Standard Wash',
                    icon: Image.asset('assets/icons/drop.png'),
                    features: [
                      "Gentle Cycle",
                      "Fragrance Option",
                      "Delivery in 24-48 hours",
                    ],
                  ),
                  Spacer(),
                  Card2(
                    onTap: () {},
                    title: 'Express Wash',
                    icon: Image.asset('assets/icons/flash.png'),
                    features: [
                      "Quick Wash Cycle",
                      'Priority Delivery',
                      'Optional Steam Finish',
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Customize Your Wash',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Choose optional features to personalize your \nexperience.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              ),

              SizedBox(height: 16.h),
              SteamCard(
                title: 'Add Steam Finish',
                title2: 'Remove Wrinkles With Steam Press',
              ),
              SizedBox(height: 16.h),
              CustomElevatedButton(
                label: 'Confirm & Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FragranceCard1()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
