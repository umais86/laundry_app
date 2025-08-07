import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/nav_screens/services/our_service_card.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class OurServices extends StatefulWidget {
  const OurServices({super.key});

  @override
  State<OurServices> createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  final List<Map<String, dynamic>> serviceData = [
    {
      'imagePath': 'assets/images/dry.png',
      'text': 'Dry Cleaning',
      'subText':
          'Expert care for suits and delicate fabrics using eco-friendly solvents',
      'price': 50.0,
    },
    {
      'imagePath': 'assets/images/press.png',
      'text': 'Executive Dressing',
      'subText':
          'Crisp finishes for business attire with precision steam technology',
      'price': 35.0,
    },
    {
      'imagePath': 'assets/images/care.png',
      'text': 'Couture Care',
      'subText': 'Hand-cleaning for designer garments and delicate fabrics',
      'price': 120.0,
    },
    {
      'imagePath': 'assets/images/bisht.png',
      'text': 'Bisht Restoration',
      'subText': 'Traditional cleaning and pressing for Qatari formal wear',
      'price': 80.0,
    },
    {
      'imagePath': 'assets/images/frag.png',
      'text': 'Fragrance Infusion',
      'subText': 'Luxury scent options for your garments',
      'price': 20.0,
    },
    {
      'imagePath': 'assets/images/dishdasha.png',
      'text': 'Dishdasha',
      'subText': "Professional care for men's traditional Qatari\ngarment",
      'price': 45.0,
    },
    {
      'imagePath': 'assets/images/bisht1.png',
      'text': 'Bisht',
      'subText': "Premium care for ceremonial cloak with gold detailing",
      'price': 90.0,
    },
    {
      'imagePath': 'assets/images/ghutra.png',
      'text': 'Ghutra',
      'subText': "Gentle cleaning for traditional headwear",
      'price': 25.0,
    },
    {
      'imagePath': 'assets/images/kurta.png',
      'text': 'Kuurta',
      'subText': "Care for traditional South Asian tunic",
      'price': 40.0,
    },
    {
      'imagePath': 'assets/images/kurtaPajama.png',
      'text': 'Kurta Pyjama (Set)',
      'subText': "Complete set cleaning for traditional attire",
      'price': 60.0,
    },
    {
      'imagePath': 'assets/images/kameez.png',
      'text': 'Kameez',
      'subText': "Specialized care for flowing traditional gowns",
      'price': 55.0,
    },
    {
      'imagePath': 'assets/images/jalabiya.png',
      'text': 'Jalabiya',
      'subText': "Premium care for ceremonial cloak with gold detailing",
      'price': 90.0,
    },
    {
      'imagePath': 'assets/images/abaya.png',
      'text': 'Abaya',
      'subText': "Professional cleaning for everyday abayas",
      'price': 50.0,
    },
    {
      'imagePath': 'assets/images/abaya_special.png',
      'text': 'Abaya Special',
      'subText': "Premium care for embellished abayas",
      'price': 80.0,
    },
    {
      'imagePath': 'assets/images/hijab.png',
      'text': 'Hijab',
      'subText': "Delicate cleaning for headscarves",
      'price': 20.0,
    },
    {
      'imagePath': 'assets/images/suit.png',
      'text': 'Gent Suit (3pcs)',
      'subText': "Complete care for 3-piece suits",
      'price': 75.0,
    },
    {
      'imagePath': 'assets/images/sdress.png',
      'text': 'Dress (Short)',
      'subText': "Care for cocktail and summer dresses",
      'price': 45.0,
    },
    {
      'imagePath': 'assets/images/dressLong.png',
      'text': 'Dress (Long)',
      'subText': "Specialized care for evening gowns",
      'price': 65.0,
    },
    {
      'imagePath': 'assets/images/overcoat.png',
      'text': 'Overcoat',
      'subText': "Winter coat cleaning and preservation",
      'price': 70.0,
    },
    {
      'imagePath': 'assets/images/military_suite.png',
      'text': 'Military Uniform',
      'subText': "Regimental standard cleaning and pressing",
      'price': 85.0,
    },
    {
      'imagePath': 'assets/images/blouse.png',
      'text': 'Blouse (Special)',
      'subText': "Delicate care for embellished tops",
      'price': 55.0,
    },
    {
      'imagePath': 'assets/images/bathrob.png',
      'text': 'Bath Robe',
      'subText': "RDeep cleaning for plush bathrobes",
      'price': 40.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Our Services',
                style: TextStyle(
                  color: txtColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1.5, color: txtColor)),
                  Text(
                    'LUXURY GARMENT CARE',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Expanded(child: Divider(thickness: 1.5, color: txtColor)),
                ],
              ),
              SizedBox(height: 16.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: serviceData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.66,
                ),
                itemBuilder: (context, index) {
                  final item = serviceData[index];
                  return OurServiceCard(
                    imagePath: item['imagePath'],
                    text: item['text'],
                    subText: item['subText'],
                    price: item['price'],
                    iscarting: true,
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
