import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/view/how_it_work.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  final Map<String, Widget Function()> optionToScreen = {
    'How It Works': () => const HowItWork(),
    // Add more options as needed
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButton<String>(
        hint: Text('Select a page', style: TextStyle(fontSize: 14.sp)),
        value: selectedValue,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down, size: 24.sp),
        underline: const SizedBox(),
        items: optionToScreen.keys.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: TextStyle(fontSize: 14.sp)),
          );
        }).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            setState(() {
              selectedValue = newValue;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => optionToScreen[newValue]!(),
              ),
            ).then((_) {
              setState(() {
                selectedValue = null;
              });
            });
          }
        },
      ),
    );
  }
}
