import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/perfume_card.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/cloth_screen.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class Fragrance extends StatefulWidget {
  const Fragrance({super.key});

  @override
  State<Fragrance> createState() => _FragranceState();
}

class _FragranceState extends State<Fragrance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.r,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Select Fragrance',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                "Mens Fragrance :",
                style: TextStyle(
                  color: txtColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PerfumeCard(
                    imagePath: 'assets/images/elixr.png',
                    text: 'Elixr Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    isCarting: true,
                    price: 7,
                  ),
                  PerfumeCard(
                    imagePath: 'assets/images/imperial.png',
                    text: 'Imperial Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    isCarting: true,
                    price: 7,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                "Women's Fragrance :",
                style: TextStyle(
                  color: txtColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PerfumeCard(
                    imagePath: 'assets/images/orchid.png',
                    text: 'Orchid Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    isCarting: true,
                    price: 7,
                  ),
                  PerfumeCard(
                    imagePath: 'assets/images/moony.png',
                    text: 'Moony Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    isCarting: true,
                    price: 7,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomElevatedButton(
                label: "Confirm & Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ClothScreen()),
                  );
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
