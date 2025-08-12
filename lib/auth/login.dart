import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/auth/forgot_pass.dart';
import 'package:par_1/auth/sign_up.dart';
import 'package:par_1/auth/txt_field/label.dart';
import 'package:par_1/auth/txt_field/pass_field.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/nav_screens/nav_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _emailFocused = false;
  bool _passwordFocused = false;
  bool _agreedToTerms = true;

  @override
  void initState() {
    super.initState();

    _emailFocusNode.addListener(() {
      setState(() => _emailFocused = _emailFocusNode.hasFocus);
    });

    _passwordFocusNode.addListener(() {
      setState(() => _passwordFocused = _passwordFocusNode.hasFocus);
    });
  }

  Future<void> _signIn() async {
    if (emailcontroller.text.trim().isEmpty ||
        passcontroller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill in both email and password."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passcontroller.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => NavBar()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format.';
      } else {
        errorMessage = 'Login failed. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
                          SizedBox(height: 20),
                          Text(
                            'Sign In to your account',
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100.h),
                      CustomLabel(text: 'Email Address'),
                      SizedBox(height: 12.h),
                      _buildInputField(
                        emailcontroller,
                        'johndoe@gmail.com',
                        _emailFocusNode,
                        _emailFocused,
                        Icons.email_outlined,
                      ),
                      SizedBox(height: 12.h),
                      CustomLabel(text: 'Password'),
                      SizedBox(height: 16.h),
                      CustomPasswordField(
                        controller: passcontroller,
                        hint: 'Enter your password',
                        focusNode: _passwordFocusNode,
                        unfocusedColor: subColor,
                      ),
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ForgotPassword()),
                          );
                        },
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
                    onPressed: _signIn,
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

  Widget _buildInputField(
    TextEditingController controller,
    String hint,
    FocusNode focusNode,
    bool isFocused,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: subColor),
        hintText: hint,
        fillColor: Colors.grey.shade200,
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
