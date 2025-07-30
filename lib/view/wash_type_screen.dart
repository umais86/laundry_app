import 'package:flutter/material.dart';
import 'package:par_1/components/card2.dart';
import 'package:par_1/components/card3.dart';
import 'package:par_1/components/card4.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/cloth_screen.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/widgets/custom_app_bar1.dart';
import 'package:provider/provider.dart';

class WashTypeScreen extends StatefulWidget {
  const WashTypeScreen({super.key});

  @override
  State<WashTypeScreen> createState() => _WashTypeScreenState();
}

class _WashTypeScreenState extends State<WashTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        color: Colors.white,
        color1: txtColor1,
        color2: txtColor1,
        color3: Colors.white,
        color4: Colors.white,
        color5: txtColor,
        color6: Colors.white,
        color7: Colors.white,
        color8: txtColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'How would you like us to clean \nyour garments?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose the cleaning style that best fits your \nneeds — standard care or express service.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Card2(
                    onTap: () {},
                    title: 'Standard Wash',
                    icon: Image.asset('assets/icons/drop.png'),
                    features: [
                      "Gentle Cycle",
                      "Fragrance Option",
                      "Delivery in 24-48 hours",
                    ],
                  ),
                  Spacer(),
                  Card2(
                    onTap: () {},
                    title: 'Express Wash',
                    icon: Image.asset('assets/icons/flash.png'),
                    features: [
                      "Quick Wash Cycle",
                      'Priority Delivery',
                      'Optional Steam Finish',
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Customize Your Wash',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: txtColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                textAlign: TextAlign.center,
                'Choose optional features to personalize your \nexperience.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  FragranceCard(
                    title: "Men’s Fragrance",
                    options: ['Elixir', 'Imperial'],
                    iconAssetPath: 'assets/icons/perfume.png',
                    initialSwitchValue: true,
                    onSelectionChanged: (isOn, selectedScent) {
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).updateMenFragrance(isOn, selectedScent);
                    },
                  ),
                  Spacer(),
                  FragranceCard(
                    title: "Women’s Fragrance",
                    options: ['Orchid', 'Moony'],
                    iconAssetPath: 'assets/icons/perfume.png',
                    initialSwitchValue: false,
                    onSelectionChanged: (isOn, selectedScent) {
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).updateWomenFragrance(isOn, selectedScent);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              SteamCard(
                title: 'Add Steam Finish',
                title2: 'Remove Wrinkles With Steam Press',
              ),
              SizedBox(height: 16),
              CustomElevatedButton(
                label: 'Confirm & Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ClothScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
