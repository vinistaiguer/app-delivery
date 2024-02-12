import 'package:flutter/material.dart';

class LoginImageLogo extends StatelessWidget {
  const LoginImageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(child: Image.asset('assets/DetalheLogoLogin.png')),
          Positioned(
            top: 130,
            left: 115,
            child: Image.asset('assets/Logo.png'),
          ),
        ],
      ),
    );
  }
}
