import 'package:flutter/material.dart';

class RegularTextField extends StatelessWidget {
  const RegularTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
  }) : super(key: key);
  final String labelText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: labelText,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 60),
          child: TextField(
            obscureText: obscureText,
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
              prefixIcon: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
