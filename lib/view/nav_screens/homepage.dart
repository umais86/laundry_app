import 'package:flutter/material.dart';
import 'package:par_1/components/card.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/wash_type_screen.dart';
import 'package:par_1/widgets/custom_app_bar1.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        color: txtColor,
        color1: Colors.white,
        color2: Colors.white,
        color3: Colors.white,
        color4: Colors.white,
        color5: Colors.white,
        color6: txtColor1,
        color7: txtColor1,
        color8: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/dress.png',
              height: 253,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'The Akoya Collection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: txtColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                textAlign: TextAlign.center,
                'The Akoya Collection is where care meets class. Elevate your laundry experience with exclusive, personalized touches',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconLabel(
                    'assets/icons/infusion.png',
                    'Perfume\nInfusion',
                    () {},
                  ),
                  _buildIconLabel(
                    'assets/icons/pkg.png',
                    'Premium\nPackaging',
                    () {},
                  ),
                  _buildIconLabel(
                    'assets/icons/iron.png',
                    'Steam\nFinishing',
                    () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Text(
              textAlign: TextAlign.center,
              'How would you like us to clean your garments?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: txtColor,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceCard(
                  title: 'Standard Wash',
                  icon: Image.asset('assets/icons/drop.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WashTypeScreen()),
                    );
                  },
                ),
                ServiceCard(
                  title: 'Express Wash',
                  icon: Image.asset('assets/icons/flash.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => WashTypeScreen()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildIconLabel(String iconPath, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
            child: Image.asset(iconPath, height: 30, width: 30),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
