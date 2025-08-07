import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final TextEditingController msgcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                color: txtColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(child: Divider(thickness: 1.5, color: txtColor)),
                Text(
                  'GET IN TOUCH',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(child: Divider(thickness: 1.5, color: txtColor)),
              ],
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Send Us Message',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel("Name"),
                SizedBox(height: 8.h),
                _buildInputField(controller, "John doe"),
                SizedBox(height: 10.h),
                _buildLabel('Email'),
                SizedBox(height: 8.h),
                _buildEmailInputField(emailcontroller, "your@mail.com"),
                SizedBox(height: 10.h),
                _buildLabel('Your Message'),
                SizedBox(height: 8.h),
                TextField(
                  controller: msgcontroller,
                  minLines: 6,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'How can we help you?',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: txtColor, width: 1.5.w),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.1.w, color: subColor),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45.h),
                    backgroundColor: Colors.black87,
                    foregroundColor: white,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Send Message",
                    style: TextStyle(color: white, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Text(
    text,
    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
  );
  Widget _buildEmailInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: emailcontroller,
      decoration: InputDecoration(
        hintText: hint,
        // fillColor: const Color.fromARGB(255, 215, 236, 245),
        // filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: txtColor, width: 1.5.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 0.1, color: subColor),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        // fillColor: const Color.fromARGB(255, 215, 236, 245),
        // filled: true,
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: subColor, width: 0.1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: txtColor, width: 1.5.w),
        ),
      ),
    );
  }
}
