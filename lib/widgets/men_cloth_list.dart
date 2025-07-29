import 'package:flutter/material.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/pkg_style_screen.dart';
import 'package:par_1/widgets/counter.dart';

class MenClothList extends StatelessWidget {
  const MenClothList({super.key});

  final List<Map<String, String>> menClothes = const [
    {"icon": "assets/icons/kandura.png", "label": "Kandura"},
    {"icon": "assets/icons/shirt.png", "label": "Shirt"},
    {"icon": "assets/icons/pant.png", "label": "Pant"},
    {"icon": "assets/icons/socks.png", "label": "Socks"},
    {"icon": "assets/icons/trouser.png", "label": "Trouser"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: menClothes.length,
            itemBuilder: (context, index) {
              final cloth = menClothes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _buildContainer(cloth["icon"]!, cloth["label"]!),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '+ Add More Items',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: txtColor,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomElevatedButton(
            label: 'Continue',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PkgStyleScreen()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContainer(String iconPath, String label) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 2),
            blurRadius: 2,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 30, height: 30),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Counter1(clothLabel: label, iconPath: ''),
        ],
      ),
    );
  }
}
