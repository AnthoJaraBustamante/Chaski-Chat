import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  const RegularTextField({
    Key? key,
    required this.labelText,
    this.margin = const EdgeInsets.symmetric(horizontal: 60),
    this.obscureText = false,
    this.onPressedSuffixIcon,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconTooltip,
    this.keyboardType,
    this.controller,
    this.onEditingComplete,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final EdgeInsetsGeometry margin;
  final void Function()? onPressedSuffixIcon;
  final String? suffixIconTooltip;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: labelText,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          margin: margin,
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              labelText: labelText,
              labelStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(
                      onPressed: onPressedSuffixIcon,
                      tooltip: suffixIconTooltip,
                      splashRadius: 20,
                      icon: Icon(
                        suffixIcon,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
