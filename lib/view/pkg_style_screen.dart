import 'package:flutter/material.dart';
import 'package:par_1/providers/cart_provider.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/personalized_card.dart';
import 'package:par_1/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class PkgStyleScreen extends StatefulWidget {
  const PkgStyleScreen({super.key});

  @override
  State<PkgStyleScreen> createState() => _PkgStyleScreenState();
}

class _PkgStyleScreenState extends State<PkgStyleScreen> {
  String? _selectedPackaging;
  // String? _selectedPerfume;

  final List<String> perfumes = ['None', 'Lavender', 'Rose', 'Citrus'];

  void _onSelectPackaging(String packaging) {
    setState(() {
      _selectedPackaging = packaging;
    });
    Provider.of<CartProvider>(context, listen: false).setPackaging(packaging);
  }

  void _onConfirm() {
    if (_selectedPackaging == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a packaging option')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PersonalizedCard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, size: 22),
            ),
            const SizedBox(height: 6),
            Center(
              child: Text(
                'How Would You Like Us To \nPackage Your Garments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Packaging Options
            _buildContainer(
              'Plastic Wrap',
              'assets/images/plastic.png',
              'Clean and simple wrap, \ntransparent protection.',
              () => _onSelectPackaging('Plastic Wrap'),
              isSelected: _selectedPackaging == 'Plastic Wrap',
            ),
            const SizedBox(height: 16),
            _buildContainer(
              'Luxury Fabric Wrap',
              'assets/images/fabric.png',
              'Hidden, soft-touch \nwrapping with luxurious \ntexture.',
              () => _onSelectPackaging('Luxury Fabric Wrap'),
              isSelected: _selectedPackaging == 'Luxury Fabric Wrap',
            ),
            const SizedBox(height: 16),
            _buildContainer(
              'Premium Box',
              'assets/images/premium.png',
              'Elegant gift box with \nmagnetic closure and \nscent-preserving lining.',
              () => _onSelectPackaging('Premium Box'),
              isSelected: _selectedPackaging == 'Premium Box',
            ),

            const SizedBox(height: 24),

            // Optional Perfume Dropdown
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: Text(
            //     'Optional Perfume',
            //     style: TextStyle(fontWeight: FontWeight.w600),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: DropdownButtonFormField<String>(
            //     decoration: const InputDecoration(
            //       hintText: 'Select perfume (optional)',
            //       contentPadding: EdgeInsets.symmetric(horizontal: 12),
            //     ),
            //     value: _selectedPerfume,
            //     items: perfumes.map((String perfume) {
            //       return DropdownMenuItem<String>(
            //         value: perfume,
            //         child: Text(perfume),
            //       );
            //     }).toList(),
            //     onChanged: (value) {
            //       setState(() {
            //         _selectedPerfume = value;
            //       });
            //       if (value != null && value != 'None') {
            //         Provider.of<CartProvider>(
            //           context,
            //           listen: false,
            //         ).setPerfume(value);
            //       } else {
            //         Provider.of<CartProvider>(
            //           context,
            //           listen: false,
            //         ).setPerfume('');
            //       }
            //     },
            //   ),
            // ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              label: 'Confirm & Continue',
              onPressed: _onConfirm,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
    String title,
    String imgPath,
    String label,
    VoidCallback onTap, {
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFE29A4F).withValues(alpha: 0.15)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 2),
                blurRadius: 4,
                color: Colors.grey.shade500,
              ),
            ],
            border: Border.all(
              color: isSelected ? const Color(0xFFE29A4F) : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.asset(imgPath, height: 80, width: 93, fit: BoxFit.cover),
                const SizedBox(width: 70),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
