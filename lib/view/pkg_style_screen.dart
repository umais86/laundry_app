import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/personalized_card.dart';
import 'package:par_1/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class PkgStyleScreen extends StatefulWidget {
  const PkgStyleScreen({super.key});

  @override
  State<PkgStyleScreen> createState() => _PkgStyleScreenState();
}

class _PkgStyleScreenState extends State<PkgStyleScreen> {
  String? _selectedPackaging;

  void _onSelectPackaging(String packaging) {
    setState(() {
      _selectedPackaging = packaging;
    });
    Provider.of<CartProvider>(context, listen: false).setPackaging(packaging);
  }

  void _onConfirm() {
    if (_selectedPackaging == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a packaging option')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PersonalizedCard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, size: 22.sp),
            ),
            SizedBox(height: 6.h),
            Center(
              child: Text(
                'How Would You Like Us To \nPackage Your Garments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16.h),

            _buildContainer(
              'Plastic Wrap',
              'assets/images/plastic.png',
              'Clean and simple wrap, \ntransparent protection.',
              () => _onSelectPackaging('Plastic Wrap'),
              isSelected: _selectedPackaging == 'Plastic Wrap',
            ),
            SizedBox(height: 16.h),
            _buildContainer(
              'Luxury Fabric Wrap',
              'assets/images/fabric.png',
              'Hidden, soft-touch \nwrapping with luxurious \ntexture.',
              () => _onSelectPackaging('Luxury Fabric Wrap'),
              isSelected: _selectedPackaging == 'Luxury Fabric Wrap',
            ),
            SizedBox(height: 16.h),
            _buildContainer(
              'Premium Box',
              'assets/images/premium.png',
              'Elegant gift box with \nmagnetic closure and \nscent-preserving lining.',
              () => _onSelectPackaging('Premium Box'),
              isSelected: _selectedPackaging == 'Premium Box',
            ),

            SizedBox(height: 30.h),
            CustomElevatedButton(
              label: 'Confirm & Continue',
              onPressed: _onConfirm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
    String title,
    String imgPath,
    String label,
    VoidCallback onTap, {
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Container(
          width: double.infinity,
          height: 115.h,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFE29A4F).withValues(alpha: 0.36)
                : white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 2),
                blurRadius: 4,
                color: Colors.grey.shade500,
              ),
            ],
            border: Border.all(
              color: isSelected ? const Color(0xFFE29A4F) : Colors.transparent,
              width: 1.5.w,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10.r),
                  child: Image.asset(
                    imgPath,
                    height: 95.h,
                    width: 93.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 40.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
