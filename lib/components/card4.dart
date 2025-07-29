import 'package:flutter/material.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class SteamCard extends StatefulWidget {
  final String title;
  final String title2;

  const SteamCard({super.key, required this.title, required this.title2});

  @override
  State<SteamCard> createState() => _SteamCardState();
}

class _SteamCardState extends State<SteamCard> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    bool isOn = cartProvider.isSteamSelected;

    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 2),
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFD1A32F),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Transform.scale(
                scale: 0.65,
                child: Switch(
                  value: isOn,
                  onChanged: (value) {
                    cartProvider.toggleSteam(value);
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.grey.shade300,
                  inactiveThumbColor: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            widget.title2,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
