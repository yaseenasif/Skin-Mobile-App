import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart'; // Update the import path for AppColors

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPasswordField;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPasswordField = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    if (!widget.isPasswordField) {
      _obscureText = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      cursorColor: AppColors.textPrimary,
      decoration: InputDecoration(
        hintText: widget.labelText, // Use hintText instead of labelText
        hintStyle: TextStyle(color: Colors.grey[600]), // Customize hint style
        filled: true,
        fillColor: Colors.grey[200],

        // border: UnderlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: const BorderSide(color: AppColors.primary),
        // ),
        // enabledBorder: UnderlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: const BorderSide(color: AppColors.primary),
        // ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
