import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart'; // Update the import path for AppColors

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final bool autoFocus;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPasswordField = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.fillColor,
    this.hintStyle,
    this.autoFocus = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
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
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: widget.hintStyle ?? TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: widget.fillColor ?? Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
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
