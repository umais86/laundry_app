import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class OrderSummaryScreen extends StatelessWidget {
  final String from;
  final String to;

  const OrderSummaryScreen({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;
    final selectedPackaging = cartProvider.packaging ?? "None";
    final selectedPerfume = cartProvider.perfume ?? "None";
    final steamSelected = cartProvider.isSteamSelected;

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 239, 238, 237),
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, size: 22, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  const Text(
                    "Order Summary",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      "Review before confirming",
                      style: TextStyle(color: txtColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Cart Items
              ...cartItems.entries
                  .where((e) => e.value > 0)
                  .map((e) => _buildItemRow(e.key, e.value.toString())),
              const SizedBox(height: 10),

              // Packaging
              _buildItemRow("Packaging", selectedPackaging),

              // Perfume
              if (selectedPerfume.isNotEmpty && selectedPerfume != "None")
                _buildItemRow("Perfume", selectedPerfume),

              // Steam Finish
              if (steamSelected) _buildItemRow("Steam Finish", "ON"),

              // const Divider(height: 30, thickness: 1),

              // From/To Fields
              if (from.isNotEmpty) _buildItemRow("From", from),
              if (to.isNotEmpty) _buildItemRow("To", to),

              const Divider(height: 30, thickness: 1),

              _buildItemRow("Total", "QAR 0"),

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
          // Icon(),
          Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
