import 'package:flutter/material.dart';

import '../../../core/palette.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Icon? icon;

  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 189, 189, 189),
                blurRadius: 5,
                offset: Offset(0, 4))
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          iconColor: Palette.primary,
          icon: icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          hintText: labelText,
        ),
      ),
    );
  }
}
