import 'package:flutter/material.dart';
import 'package:par_1/utils/button.dart';
import 'package:par_1/utils/colors.dart';
import 'package:par_1/view/order_summary_screen.dart';
import 'package:par_1/widgets/custom_app_bar.dart';

class PersonalizedCard extends StatefulWidget {
  const PersonalizedCard({super.key});

  @override
  State<PersonalizedCard> createState() => _PersonalizedCardState();
}

class _PersonalizedCardState extends State<PersonalizedCard> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitaddress() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OrderSummaryScreen(
            from: fromController.text.trim(),
            to: toController.text.trim(),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please fill out both fields'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 22),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Personalized Card',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Want to include a card with your name or \ndedicate it to someone?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // From Field
                      TextFormField(
                        controller: fromController,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                            ? 'Please Enter From name'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'From',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // To Field
                      TextFormField(
                        controller: toController,
                        validator: (value) =>
                            value == null || value.trim().isEmpty
                            ? 'Please Enter To name'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'To',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),
                      CustomElevatedButton(
                        label: 'Confirm & Continue',
                        onPressed: _submitaddress,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
