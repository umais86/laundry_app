import 'package:flutter/material.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/utils/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController cpasswordcontroller = TextEditingController();

  bool _obscurePassword = true;

  bool _agreedToTerms = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(
                            color: Color(0xFFD4Af37),
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Create your Akoya account to enjoy personalized \nservices and premium laundry care.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),

                  SizedBox(height: 5),
                  const SizedBox(height: 24),
                  _buildLabel('Name'),
                  _buildInputField(nameController, 'Sarah'),
                  const SizedBox(height: 16),
                  _buildLabel('Email'),
                  _buildInputField(emailcontroller, 'Sarah@gmail.com'),
                  const SizedBox(height: 16),
                  _buildLabel('Password'),
                  _buildPasswordField(passwordcontroller),
                  const SizedBox(height: 16),
                  _buildLabel('Confirm Password'),
                  _buildcPasswordField(cpasswordcontroller),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: txtColor,
                        value: _agreedToTerms,
                        onChanged: (val) {
                          setState(() => _agreedToTerms = val!);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Text('Agree with '),
                      Text(
                        'terms & conditions',
                        style: const TextStyle(color: Color(0xFFB48B25)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    label: 'Sign Up',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/main');
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1.5)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or sign up with',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 1.5)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton('assets/images/google.png'),
                      const SizedBox(width: 20),
                      _buildSocialButton('assets/images/fb.png'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xFFB48B25),
                            fontWeight: FontWeight.bold,
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
    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
  );

  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        // fillColor: Color(0xFFD4Af37),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildcPasswordField(TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: '. . . . . . . . . . ',
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Image.asset(assetPath, width: 30, height: 30),
    );
  }
}
