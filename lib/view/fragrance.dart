import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/perfume_card.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/cloth/cloth_screen.dart';
import 'package:provider/provider.dart';

class FragranceCard1 extends StatelessWidget {
  const FragranceCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
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
                        size: 24.r,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4.h),

                    Text(
                      'Select Fragrances',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/perfume.png',
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Text(
                  "Men's Fragrance :",
                  style: TextStyle(
                    color: txtColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),

                /// Men's Fragrance Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PerfumeCard(
                      imagePath: 'assets/images/elixr.png',
                      text: 'Elixr Akoya',
                      subtext:
                          'A rich, luxurious blend for a signature fragrance finish.',
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
                          'Royal and bold—crafted for the finest laundry experience.',
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

                /// Women's Fragrance Row
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
                          'A soft, dreamy scent that refreshes your laundry with grace.',
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
      ),
    );
  }
}
