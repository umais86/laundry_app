import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/auth/login.dart';
import 'package:par_1/auth/otp/otp_text_field.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150.h,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: Column(
                      children: [
                        Text(
                          'AKOYA PREMIUM LAUNDARY',
                          style: TextStyle(fontSize: 20.sp, color: txtColor),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Verify Reset Code',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.amber.shade50,
                child: Icon(
                  Icons.check_circle_outline,
                  size: 35,
                  color: txtColor,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Enter Verification Code',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              Text(
                "We've sent a 4-digit code to your mail",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(height: 20.h),
              Text(
                'Enter Verification Code',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              OtpTextField(
                onCompleted: (code) {
                  debugPrint('Entered 4-digit OTP: $code');
                },
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: CustomElevatedButton(
                  label: 'Verify Code',
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Didn't receive the code?",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Login()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, size: 16.r, color: subColor),
                        SizedBox(width: 4.w),
                        Text(
                          'Back to Log In',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: subColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
