import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FragranceCard extends StatefulWidget {
  final String title;
  final IconData? icon;
  final String? iconAssetPath;
  final List<String> options;
  final bool initialSwitchValue;
  final Function(bool)? onToggle;
  final Function(bool isOn, String selectedScent)? onSelectionChanged;

  const FragranceCard({
    super.key,
    required this.title,
    this.icon,
    this.iconAssetPath,
    required this.options,
    this.initialSwitchValue = true,
    this.onToggle,
    this.onSelectionChanged,
  });

  @override
  State<FragranceCard> createState() => _FragranceCardState();
}

class _FragranceCardState extends State<FragranceCard> {
  late bool isOn;
  late String selectedScent;

  @override
  void initState() {
    super.initState();
    isOn = widget.initialSwitchValue;
    selectedScent = widget.options.first;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSelectionChanged?.call(isOn, selectedScent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.w,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 8.r,
            offset: Offset(2.w, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 9.50.sp,
                  color: const Color(0xFFD1A32F),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Transform.scale(
                scale: 0.4,
                child: Switch(
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });

                    widget.onToggle?.call(value);

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      widget.onSelectionChanged?.call(isOn, selectedScent);
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 2.w),
              if (widget.iconAssetPath != null)
                Image.asset(
                  widget.iconAssetPath!,
                  width: 24.w,
                  height: 24.h,
                  color: const Color(0xFFD1A32F),
                )
              else if (widget.icon != null)
                Icon(widget.icon, color: const Color(0xFFD1A32F), size: 24.sp),
              SizedBox(width: 14.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.options.map((option) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: buildRadioOption(option),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildRadioOption(String label) {
    final isSelected = selectedScent == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedScent = label;
        });

        if (isOn) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onSelectionChanged?.call(isOn, selectedScent);
          });
        }
      },
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black87, width: 2.w),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFD1A32F),
                      ),
                    ),
                  )
                : null,
          ),
          SizedBox(width: 6.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
