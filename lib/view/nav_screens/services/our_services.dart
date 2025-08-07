import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/nav_screens/services/our_service_card.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class OurServices extends StatefulWidget {
  const OurServices({super.key});

  @override
  State<OurServices> createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  final List<Map<String, dynamic>> serviceData = [
    {
      'imagePath': 'assets/images/dry.png',
      'text': 'Dry Cleaning',
      'subText':
          'Expert care for suits and delicate fabrics using eco-friendly solvents',
      'price': 50.0,
    },
    {
      'imagePath': 'assets/images/press.png',
      'text': 'Executive Dressing',
      'subText':
          'Crisp finishes for business attire with precision steam technology',
      'price': 35.0,
    },
    {
      'imagePath': 'assets/images/care.png',
      'text': 'Couture Care',
      'subText': 'Hand-cleaning for designer garments and delicate fabrics',
      'price': 120.0,
    },
    {
      'imagePath': 'assets/images/bisht.png',
      'text': 'Bisht Restoration',
      'subText': 'Traditional cleaning and pressing for Qatari formal wear',
      'price': 80.0,
    },
    {
      'imagePath': 'assets/images/frag.png',
      'text': 'Fragrance Infusion',
      'subText': 'Luxury scent options for your garments',
      'price': 20.0,
    },
    {
      'imagePath': 'assets/images/dishdasha.png',
      'text': 'Dishdasha',
      'subText': "Professional care for men's traditional Qatari\ngarment",
      'price': 45.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Our Services',
                style: TextStyle(
                  color: txtColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1.5, color: txtColor)),
                  Text(
                    'LUXURY GARMENT CARE',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Expanded(child: Divider(thickness: 1.5, color: txtColor)),
                ],
              ),
              SizedBox(height: 16.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: serviceData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final item = serviceData[index];
                  return OurServiceCard(
                    imagePath: item['imagePath'],
                    text: item['text'],
                    subText: item['subText'],
                    price: item['price'],
                    iscarting: true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
