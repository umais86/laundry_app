import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/auth/login.dart';
import 'package:par_1/auth/otp_screen.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailcontrolller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
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
                      'Reset Your Passweord',
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.amber.shade50,
                  child: Icon(Icons.lock_outline, size: 35, color: txtColor),
                ),

                SizedBox(height: 16.h),
                Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Enter your email address and we'll send you a verification code to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel('Email Address'),
                SizedBox(height: 8.h),
                _buildInputField(emailcontrolller, 'your@mail.com'),
                SizedBox(height: 26.h),
                CustomElevatedButton(
                  label: 'Send Reset Code',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => OtpScreen()),
                    );
                  },
                ),
                SizedBox(height: 26.h),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1.8)),
                    Text(
                      'Remember Your Password',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: subColor,
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1.8)),
                  ],
                ),
                SizedBox(height: 26.h),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Login()),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Back to Sign In',
                      style: TextStyle(
                        color: txtColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) => Text(
    text,
    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
  );
  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: emailcontrolller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        hintText: hint,
        fillColor: const Color.fromARGB(255, 215, 236, 245),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
