import 'package:flutter/material.dart';
import 'package:par_1/utils/colors.dart';

class Card2 extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget icon;
  final List<String> features; // New for bullet points

  const Card2({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFF0C341);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 176,
        width: 165,
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(3, 5),
            ),
          ],
          border: const Border(top: BorderSide(color: gold, width: 4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: icon),
            const SizedBox(height: 6),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: gold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            ...features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.circle, size: 8, color: gold),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: txtColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
