import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';

class Card2 extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final Widget icon;
  final List<String> features;

  const Card2({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.features,
  });

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  List<String> selectedFeatures = [];

  @override
  void initState() {
    super.initState();
    selectedFeatures = List.from(widget.features);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        height: 182.h,
        width: 163.w,
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0x33000000),
              blurRadius: 10.r,
              spreadRadius: 1.r,
              offset: Offset(3.w, 5.h),
            ),
          ],
          border: Border(
            top: BorderSide(color: txtColor, width: 4.w),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: widget.icon),
            SizedBox(height: 4.h),
            Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: txtColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.features.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final feature = widget.features[index];
                  final isSelected = selectedFeatures.contains(feature);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 0.7,
                        child: Checkbox(
                          value: isSelected,
                          activeColor: txtColor,
                          visualDensity: VisualDensity.compact,
                          side: BorderSide(width: 1.5.w),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedFeatures.add(feature);
                              } else {
                                selectedFeatures.remove(feature);
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: txtColor1,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
