import 'package:flutter/material.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/cart_item.dart';

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
    final menFragrance = Provider.of<CartProvider>(context).menFragrance;
    final womenFragrance = Provider.of<CartProvider>(context).womenFragrance;

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(
                  "Review before confirming",
                  style: TextStyle(color: txtColor, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Selected Items',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (cartItems.isEmpty) const Text("No items selected."),
              ...cartItems.values
                  .where((item) => item.quantity > 0)
                  .map((item) => _buildCartItemRow(item)),

              const SizedBox(height: 20),

              _buildItemRow("Packaging", selectedPackaging),

              if (menFragrance != null)
                _buildItemRow("Men's Fragrance", menFragrance),
              if (womenFragrance != null)
                _buildItemRow("Women's Fragrance", womenFragrance),

              if (steamSelected) _buildItemRow("Steam Finish", "ON"),

              if (from.isNotEmpty) _buildItemRow("From", from),
              if (to.isNotEmpty) _buildItemRow("To", to),

              const SizedBox(height: 30),

              CustomElevatedButton(
                label: 'Confirm & Order WhatsApp',
                onPressed: () {
                  debugPrint("Order confirmed. From: $from | To: $to");
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItemRow(CartItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(
            item.iconPath,
            width: 30,
            height: 30,
            cacheWidth: 60,
            cacheHeight: 60,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, size: 30);
            },
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: txtColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              item.quantity.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(),
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
