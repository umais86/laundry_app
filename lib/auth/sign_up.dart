import 'package:flutter/material.dart';
import 'package:par_1/auth/login.dart';
import 'package:par_1/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController cpasswordcontroller = TextEditingController();

  bool _obscurePassword = true;
  bool _agreedToTerms = true;
  bool _isLoading = false;

  final _auth = FirebaseAuth.instance;

  void _signUp() async {
    String name = nameController.text.trim();
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    String cpassword = cpasswordcontroller.text.trim();

    // Input validation
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        cpassword.isEmpty) {
      _showError("Please fill all fields.");
      return;
    }
    if (!email.contains("@")) {
      _showError("Please enter a valid email.");
      return;
    }
    if (password.length < 6) {
      _showError("Password must be at least 6 characters.");
      return;
    }
    if (password != cpassword) {
      _showError("Passwords do not match.");
      return;
    }
    if (!_agreedToTerms) {
      _showError("You must agree to the terms & conditions.");
      return;
    }

    try {
      setState(() => _isLoading = true);

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _auth.currentUser?.updateDisplayName(name);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Login()),
      );
    } on FirebaseAuthException catch (e) {
      _showError(e.message ?? "Signup failed.");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(
                            color: const Color(0xFFD4Af37),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Create your Akoya account to enjoy personalized services and premium \nlaundry care.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.h),
                  _buildLabel('Name'),
                  _buildInputField(nameController, 'John Doe'),
                  SizedBox(height: 16.h),
                  _buildLabel('Email'),
                  _buildInputField(emailcontroller, 'Johndoe@gmail.com'),
                  SizedBox(height: 16.h),
                  _buildLabel('Password'),
                  _buildPasswordField(passwordcontroller),
                  SizedBox(height: 16.h),
                  _buildLabel('Confirm Password'),
                  _buildcPasswordField(cpasswordcontroller),
                  SizedBox(height: 16.h),
                  Row(
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
                      Text('Agree with ', style: TextStyle(fontSize: 13.sp)),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'terms & conditions',
                          style: TextStyle(
                            color: const Color(0xFFB48B25),
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                          label: 'Sign Up',
                          onPressed: _signUp,
                        ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 1.8.h)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          'or sign up with',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 1.8.h)),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(fontSize: 13.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const Login()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: const Color(0xFFB48B25),
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.black45,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildcPasswordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: '. . . . . . . . . . ',
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
