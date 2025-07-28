import 'package:flutter/material.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class PkgStyleScreen extends StatelessWidget {
  const PkgStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 22),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                'How Would You Like Us To \nPackage Your Garments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildContainer(
              'Plastic Wrap',
              'assets/images/plastic.png',
              'Clean and simple wrap, \ntransparent protection.',
              () {},
            ),
            SizedBox(height: 16),
            _buildContainer(
              'Luxury Fabric Wrap',
              'assets/images/fabric.png',
              'Hidden, soft-touch \nwrapping with luxurious \ntexture.',
              () {},
            ),
            SizedBox(height: 16),
            _buildContainer(
              'Premium Box',
              'assets/images/premium.png',
              'Elegant gift box with \nmagnetic closure and \nscent-preserving lining.',
              () {},
            ),
            SizedBox(height: 40),
            CustomElevatedButton(label: 'Confirm & Continue', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
    String title,
    String imgPath,
    String label,
    VoidCallback ontap,
  ) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 97,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 2),
                blurRadius: 4,
                color: Colors.grey.shade500,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.asset(imgPath, height: 80, width: 93, fit: BoxFit.cover),
                SizedBox(width: 70),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
