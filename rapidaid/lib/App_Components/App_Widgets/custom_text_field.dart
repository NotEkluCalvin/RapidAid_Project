import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hinttext;
  final TextStyle? hinttextstyle;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hinttext,
    this.hinttextstyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        keyboardType: keyboardType,
        validator: validator,
        onTap: onTap,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hinttext,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.black54),
          prefixIcon:
              prefixIcon != null
                  ? Icon(prefixIcon, color: myMainColor, size: 20)
                  : null,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 2),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}

class CustomNumberField extends StatelessWidget {
  final TextEditingController? controller;
  final String hinttext;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const CustomNumberField({
    super.key,
    this.controller,
    required this.hinttext,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.number,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        maxLength: 10,
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        keyboardType: keyboardType,
        validator: validator,
        onTap: onTap,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hinttext,
          labelStyle: const TextStyle(fontSize: 14, color: Colors.black54),
          prefixIcon:
              prefixIcon != null
                  ? Icon(prefixIcon, color: myMainColor, size: 20)
                  : null,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: myMainColor, width: 2),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
