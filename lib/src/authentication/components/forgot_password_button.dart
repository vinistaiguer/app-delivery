import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ForgotPasswordButton extends StatelessWidget {
  final String title;

  const ForgotPasswordButton(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Modular.to.navigate('/forgot-password');
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFD4AE01),
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 0,
          letterSpacing: 0.25,
        ),
      ),
    );
  }
}
