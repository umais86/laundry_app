import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/utils/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  'assets/images/welcome-img.png',
                  height: 400.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 45.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  children: [
                    const TextSpan(text: 'Welcome to '),
                    TextSpan(
                      text: 'The Akoya',
                      style: TextStyle(color: txtColor),
                    ),
                    const TextSpan(text: '\nCollection'),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                'Welcome to The Akoya Collection — where every garment is treated with luxury, care, and precision.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.black87),
              ),
              const Spacer(),
              CustomElevatedButton(
                label: 'Let’s get started',
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
