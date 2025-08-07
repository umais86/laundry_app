import 'package:flutter/material.dart';
import 'package:par_1/components/our_service_card.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class OurServices extends StatefulWidget {
  const OurServices({super.key});

  @override
  State<OurServices> createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            OurServiceCard(
              imagePath: 'assets/images/press.png',
              iscarting: true,
              text: 'Executive Dressing',
              subText:
                  'Crisp finishes for business attire with precision steam technology',
              price: 35,
            ),
            Spacer(),
            OurServiceCard(
              imagePath: 'assets/images/press.png',
              iscarting: true,
              text: 'Executive Dressing',
              subText:
                  'Crisp finishes for business attire with precision steam technology',
              price: 35,
            ),
          ],
        ),
      ),
    );
  }
}
