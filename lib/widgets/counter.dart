import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Counter1 extends StatelessWidget {
  final String clothLabel;
  final String iconPath;
  final double price;

  const Counter1({
    super.key,
    required this.clothLabel,
    required this.iconPath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final currentCount = cart.cartItems[clothLabel]?.quantity ?? 0;

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (currentCount > 0) {
              cart.removeItem(clothLabel);
            }
          },
          child: _circleBox(icon: Icons.remove),
        ),
        SizedBox(width: 10.w),
        _circleBox(label: '$currentCount'),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: () {
            cart.addItem(clothLabel, iconPath, price);
          },
          child: _circleBox(icon: Icons.add),
        ),
      ],
    );
  }

  Widget _circleBox({IconData? icon, String? label}) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: const Color(0xFFE29A4F),
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, color: Colors.white, size: 15.r)
            : Text(
                label ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
      ),
    );
  }
}
