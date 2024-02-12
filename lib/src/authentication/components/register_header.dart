import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterHeader extends StatelessWidget {
  final String title;

  const RegisterHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Modular.to.pop();
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: SizedBox(
              height: 270,
              width: 230,
              child: Image.asset('assets/whiskyHand.png', fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}
