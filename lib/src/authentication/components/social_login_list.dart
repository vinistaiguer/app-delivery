import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialLoginList extends StatelessWidget {
  final FacebookAuth facebookAuth;
  final GoogleSignIn googleSignIn;
  final SignInWithApple appleSignIn;

  const SocialLoginList({
    super.key,
    required this.facebookAuth,
    required this.googleSignIn,
    required this.appleSignIn,
  });

  Widget socialButton(Image image, Function callback) {
    return OutlinedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(70, 70)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ))),
      onPressed: () => callback,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: image,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ou faça login com:',
            style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            socialButton(Image.asset('assets/Facebook.png'), () {}),
            socialButton(Image.asset('assets/google.png'), () {}),
            socialButton(Image.asset('assets/apple.png'), () {}),
          ],
        ),
      ],
    );
  }
}
