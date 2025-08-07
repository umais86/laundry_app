import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/perfume_card.dart';
import 'package:par_1/utils/colors.dart';

class FragranceCard1 extends StatelessWidget {
  const FragranceCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
