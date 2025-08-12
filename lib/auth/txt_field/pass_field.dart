import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FocusNode focusNode;
  final Color unfocusedColor;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hint,
    required this.focusNode,
    required this.unfocusedColor,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() => _isFocused = widget.focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r"\s"))],
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline_sharp),
        hintText: widget.hint,
        fillColor: Colors.grey.shade200,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() => _obscureText = !_obscureText);
          },
        ),
      ),
    );
  }
}
