import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../models/cart_item.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String from;
  final String to;

  const OrderSummaryScreen({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    final selectedPackaging = cartProvider.packaging ?? "None";
    final steamSelected = cartProvider.isSteamSelected;
    final menFragrance = cartProvider.menFragrance;
    final womenFragrance = cartProvider.womenFragrance;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 22.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Center(
                child: Text(
                  "Review before confirming",
                  style: TextStyle(color: txtColor, fontSize: 18.sp),
                ),
              ),
              SizedBox(height: 16.h),

              Text(
                'Selected Items',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),

              if (cartItems.isEmpty)
                Text("No items selected.", style: TextStyle(fontSize: 14.sp)),
              ...cartItems.values
                  .where((item) => item.quantity > 0)
                  .map((item) => _buildCartItemRow(item)),

              SizedBox(height: 20.h),
              _buildItemRow("Packaging", selectedPackaging),

              if (menFragrance != null)
                _buildItemRow("Men's Fragrance", menFragrance),
              if (womenFragrance != null)
                _buildItemRow("Women's Fragrance", womenFragrance),
              if (steamSelected) _buildItemRow("Steam Finish", "ON"),
              if (from.isNotEmpty) _buildItemRow("From", from),
              if (to.isNotEmpty) _buildItemRow("To", to),

              SizedBox(height: 30.h),
              CustomElevatedButton(
                label: 'Confirm & Order WhatsApp',
                onPressed: () {
                  debugPrint("Order confirmed. From: $from | To: $to");
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItemRow(CartItem item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(
            item.iconPath,
            width: 30.w,
            height: 30.h,
            cacheWidth: 60,
            cacheHeight: 60,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.image_not_supported, size: 30.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              item.name,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 28.h,
            width: 28.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: txtColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              item.quantity.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: white,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
