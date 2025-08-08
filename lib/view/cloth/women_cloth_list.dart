import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/pkg_style_screen.dart';
import 'package:par_1/widgets/counter.dart';

class WomenClothList extends StatelessWidget {
  const WomenClothList({super.key});

  final List<Map<String, dynamic>> womenClothes = const [
    {"icon": "assets/icons/abaya.png", "label": "Abaya", "price": 0},
    {"icon": "assets/icons/hijab.png", "label": "Hijab", "price": 0},
    {"icon": "assets/icons/kaftan.png", "label": "Kaftan", "price": 0},
    {"icon": "assets/icons/skirt.png", "label": "Skirt", "price": 0},
    {"icon": "assets/icons/trouser.png", "label": "Trouser", "price": 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: womenClothes.length,
            itemBuilder: (context, index) {
              final cloth = womenClothes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _buildContainer(
                  cloth["icon"],
                  cloth["label"],
                  cloth["price"],
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '+ Add More Items',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: txtColor,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomElevatedButton(
            label: 'Continue',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PkgStyleScreen()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContainer(String iconPath, String label, double price) {
    return Container(
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 2),
            blurRadius: 2.r,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 30.w, height: 30.h),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Counter1(clothLabel: label, iconPath: iconPath, price: price),
        ],
      ),
    );
  }
}
