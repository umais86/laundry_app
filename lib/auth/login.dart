import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/auth/sign_up.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/nav_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  bool _agreedToTerms = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          Text(
                            'AKOYA PREMIUM LAUNDARY',
                            style: TextStyle(fontSize: 20, color: txtColor),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Sign In to your account',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100.h),
                      _buildLabel('Email Address'),
                      SizedBox(height: 12.h),
                      _buildInputField(emailcontroller, 'johndoe@gmail.com'),
                      SizedBox(height: 12.h),
                      _buildLabel('Password'),
                      SizedBox(height: 16.h),
                      _buildPassword(passcontroller, ''),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: txtColor,
                        value: _agreedToTerms,
                        onChanged: (val) {
                          setState(() => _agreedToTerms = val!);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      Text('Remember me ', style: TextStyle(fontSize: 13.sp)),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: txtColor, fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomElevatedButton(
                    label: 'Sign In',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => NavBar()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1.8.h)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        'New to AKOYA',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1.8.h)),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUp()),
                    );
                  },
                  child: Text(
                    'Create Your Account',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Text(
    text,
    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
  );
  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: emailcontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        hintText: hint,
        fillColor: const Color.fromARGB(255, 211, 227, 234),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPassword(TextEditingController controller, String hint) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline_sharp),
        hintText: hint,
        fillColor: const Color.fromARGB(255, 211, 227, 234),
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
