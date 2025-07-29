import 'package:flutter/material.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Counter1 extends StatelessWidget {
  final String clothLabel;
  final String iconPath;

  const Counter1({super.key, required this.clothLabel, required this.iconPath});

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
        const SizedBox(width: 10),
        _circleBox(label: '$currentCount'),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            cart.addItem(clothLabel, iconPath);
          },
          child: _circleBox(icon: Icons.add),
        ),
      ],
    );
  }

  Widget _circleBox({IconData? icon, String? label}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFFE29A4F),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, color: Colors.white, size: 15)
            : Text(
                label ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
      ),
    );
  }
}
