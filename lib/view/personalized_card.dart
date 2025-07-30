import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/order_details/order_summary_screen.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class PersonalizedCard extends StatefulWidget {
  const PersonalizedCard({super.key});

  @override
  State<PersonalizedCard> createState() => _PersonalizedCardState();
}

class _PersonalizedCardState extends State<PersonalizedCard> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitaddress() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OrderSummaryScreen(
            from: fromController.text.trim(),
            to: toController.text.trim(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please fill out both fields'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, size: 22.sp),
                ),
                SizedBox(height: 6.h),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Personalized Card',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Want to include a card with your name or \ndedicate it to someone?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // From Field
                      TextFormField(
                        controller: fromController,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                            ? 'Please Enter From name'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'From',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // To Field
                      TextFormField(
                        controller: toController,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                            ? 'Please Enter To name'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'To',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                        ),
                      ),

                      SizedBox(height: 60.h),
                      CustomElevatedButton(
                        label: 'Confirm & Continue',
                        onPressed: _submitaddress,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
