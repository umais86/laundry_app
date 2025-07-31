import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 90.r,
                backgroundImage: AssetImage('assets/images/pic 2.png'),
              ),
            ),
            SizedBox(height: 20.h),
            _buildlabel('Username'),
            SizedBox(height: 10.h),
            _buildRow('Umais', controller, 'assets/icons/profile.png'),
            SizedBox(height: 20.h),
            _buildlabel('Email'),
            SizedBox(height: 10.h),
            _buildRow1('Umais', emailcontroller),
            SizedBox(height: 80.h),
            CustomElevatedButton(label: 'Save Changes', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildlabel(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildRow(
    String hint,
    TextEditingController controller,
    String iconPath,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          iconPath,
          height: 24,
          width: 24,
          color: Colors.black54,
        ),
        fillColor: const Color.fromARGB(255, 243, 243, 243),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildRow1(String hint, TextEditingController emailcontroller) {
    return TextField(
      controller: emailcontroller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, color: Colors.black54),
        fillColor: const Color.fromARGB(255, 243, 243, 243),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
