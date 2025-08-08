import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/components/perfume_card.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/utils/colors.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
