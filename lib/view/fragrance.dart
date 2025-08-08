import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/perfume_card.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/cloth/cloth_screen.dart';
import 'package:par_1/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class Fragrance extends StatefulWidget {
  const Fragrance({super.key});

  @override
  State<Fragrance> createState() => _FragranceState();
}

class _FragranceState extends State<Fragrance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.r,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Select Fragrance',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                "Mens Fragrance :",
                style: TextStyle(
                  color: txtColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              // Inside Row for Men's Fragrance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PerfumeCard(
                    imagePath: 'assets/images/elixr.png',
                    text: 'Elixr Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    price: 7,
                    isCarting:
                        Provider.of<CartProvider>(context).menFragrance ==
                        'Elixr Akoya',
                    onPressed: () {
                      final cart = Provider.of<CartProvider>(
                        context,
                        listen: false,
                      );
                      if (cart.menFragrance == 'Elixr Akoya') {
                        cart.clearMenFragrance();
                      } else {
                        cart.setMenFragrance('Elixr Akoya', 7);
                      }
                    },
                  ),
                  PerfumeCard(
                    imagePath: 'assets/images/imperial.png',
                    text: 'Imperial Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    price: 7,
                    isCarting:
                        Provider.of<CartProvider>(context).menFragrance ==
                        'Imperial Akoya',
                    onPressed: () {
                      final cart = Provider.of<CartProvider>(
                        context,
                        listen: false,
                      );
                      if (cart.menFragrance == 'Imperial Akoya') {
                        cart.clearMenFragrance();
                      } else {
                        cart.setMenFragrance('Imperial Akoya', 7);
                      }
                    },
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              Text(
                "Women's Fragrance :",
                style: TextStyle(
                  color: txtColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PerfumeCard(
                    imagePath: 'assets/images/orchid.png',
                    text: 'Orchid Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    price: 7,
                    isCarting:
                        Provider.of<CartProvider>(context).womenFragrance ==
                        'Orchid Akoya',
                    onPressed: () {
                      final cart = Provider.of<CartProvider>(
                        context,
                        listen: false,
                      );
                      if (cart.womenFragrance == 'Orchid Akoya') {
                        cart.clearWomenFragrance();
                      } else {
                        cart.setWomenFragrance('Orchid Akoya', 7);
                      }
                    },
                  ),
                  PerfumeCard(
                    imagePath: 'assets/images/moony.png',
                    text: 'Moony Akoya',
                    subtext:
                        'Elegant floral notes to enhance freshness in every fabric',
                    price: 7,
                    isCarting:
                        Provider.of<CartProvider>(context).womenFragrance ==
                        'Moony Akoya',
                    onPressed: () {
                      final cart = Provider.of<CartProvider>(
                        context,
                        listen: false,
                      );
                      if (cart.womenFragrance == 'Moony Akoya') {
                        cart.clearWomenFragrance();
                      } else {
                        cart.setWomenFragrance('Moony Akoya', 7);
                      }
                    },
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              CustomElevatedButton(
                label: "Confirm & Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ClothScreen()),
                  );
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
