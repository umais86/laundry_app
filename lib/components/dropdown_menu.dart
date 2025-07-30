import 'package:flutter/material.dart';
import 'package:par_1/view/how_it_work.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  final Map<String, Widget> optionToScreen = {'How It Works ?': HowItWork()};

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text('Select a page'),
      value: selectedValue,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      underline: Container(height: 1, color: Colors.grey),
      items: optionToScreen.keys.map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            selectedValue = newValue;
          });

          // Navigate to selected screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => optionToScreen[newValue]!),
          );
        }
      },
    );
  }
}
