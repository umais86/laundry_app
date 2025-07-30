import 'package:flutter/material.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class HowItWork extends StatelessWidget {
  const HowItWork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, size: 22),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'How It Work',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'From pickup to doorstep delivery, here’s \nhow Akoya makes it seamless.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _containerRow(
              'assets/icons/locate.png',
              'Schedule Pickup',
              'Choose time & location\nthat suits you.',
            ),
            SizedBox(height: 8),
            _containerRow(
              'assets/icons/garments.png',
              'Garments Collected',
              'Our team collects, your \nlaundry with care.',
            ),
            SizedBox(height: 8),
            _containerRow(
              'assets/icons/drop.png',
              'Custom Wash & Treatment',
              'Fragrance , Steam packaging \nyour way.',
            ),
            SizedBox(height: 8),
            _containerRow(
              'assets/icons/home1.png',
              'Delivered To Your Door',
              'We deliver fresh, clean \ngarments on time.',
            ),
            SizedBox(height: 30),
            CustomElevatedButton(label: 'Schedule a pickup', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _containerRow(String iconPath, String title, String text) {
    return Container(
      height: 90,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(offset: Offset(1, 1), color: Colors.grey.shade50),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Image.asset(iconPath, height: 40, width: 40, color: Colors.black),
            const SizedBox(width: 36),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
