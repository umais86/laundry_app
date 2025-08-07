import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/card.dart';
import 'package:par_1/components/video_player.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/wash_type_screen.dart';
import 'package:par_1/widgets/custom_app_bar1.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        color: txtColor,
        color1: white,
        color2: white,
        color3: white,
        color4: white,
        color5: white,
        color6: txtColor1,
        color7: txtColor1,
        color8: white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 660.h,
          child: Column(
            children: [
              // Image.asset(
              //   'assets/images/dress.png',
              //   height: 253.h,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              Expanded(
                child: CustomSizedVideo(
                  width: MediaQuery.of(context).size.width,
                  height: 260.h,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'The Akoya Collection',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  textAlign: TextAlign.center,
                  'The Akoya Collection is where care meets class. Elevate your laundry experience with exclusive, personalized touches',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconLabel(
                      'assets/icons/infusion.png',
                      'Perfume\nInfusion',
                      () {},
                    ),
                    _buildIconLabel(
                      'assets/icons/pkg.png',
                      'Premium\nPackaging',
                      () {},
                    ),
                    _buildIconLabel(
                      'assets/icons/iron.png',
                      'Steam\nFinishing',
                      () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                textAlign: TextAlign.center,
                'How would you like us to clean\nyour garments?',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceCard(
                    title: 'Standard Wash',
                    icon: Image.asset('assets/icons/drop.png', height: 40.h),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => WashTypeScreen()),
                      );
                    },
                  ),
                  ServiceCard(
                    title: 'Express Wash',
                    icon: Image.asset('assets/icons/flash.png', height: 40.h),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => WashTypeScreen()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 16,
              //     vertical: 12,
              //   ),
              //   child: Column(
              //     children: [
              //       CustomElevatedButton(
              //         label: 'Continue to Garment Section',
              //         onPressed: () {},
              //       ),

              //       SizedBox(height: 16.h),
              //       Text(
              //         'Akoya Signature Fragrances',
              //         style: TextStyle(
              //           fontSize: 18.sp,
              //           fontWeight: FontWeight.w700,
              //           color: txtColor,
              //         ),
              //       ),
              //       SizedBox(height: 10.h),
              //       Text(
              //         'Premium scents crafted to elevate your laundry experience',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 14.sp,
              //           fontWeight: FontWeight.w300,
              //         ),
              //       ),
              //       SizedBox(height: 16.h),
              //       PerfumeCard(
              //         imagePath: 'assets/images/orchid.png',
              //         text: 'Orchid Akoya',
              //         subtext:
              //             'Elegant floral notes to enhance freshness in every fabric',
              //         isCarting: true,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconLabel(String iconPath, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30.r),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: white,
            radius: 24.r,
            child: Image.asset(iconPath, height: 30.h, width: 30.w),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
