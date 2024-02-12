import 'package:app_chat/src/authentication/components/register_button.dart';
import 'package:app_chat/src/authentication/components/social_login_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../shared/components/input_field.dart';
import '../components/forgot_password_button.dart';
import '../components/login_image_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late FacebookAuth _facebookAuth;
  late GoogleSignIn _googleSignIn;
  late SignInWithApple _appleSignIn;

  @override
  void initState() {
    super.initState();
    _facebookAuth = FacebookAuth.instance;
    _googleSignIn = GoogleSignIn();
    _appleSignIn = SignInWithApple();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              const LoginImageLogo(),
              Positioned(
                bottom: 4,
                left: 16,
                child: SizedBox(
                  child: Text('Entrar',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  controller: _emailController,
                  labelText: 'E-mail',
                  icon: const Icon(Icons.alternate_email),
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: _passwordController,
                  labelText: 'Senha',
                  icon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerRight,
                  child: ForgotPasswordButton('Esqueci a senha'),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Entrar',
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SocialLoginList(
            facebookAuth: _facebookAuth,
            googleSignIn: _googleSignIn,
            appleSignIn: _appleSignIn,
          ),
          const SizedBox(height: 8),
          const RegisterButton(),
        ],
      ),
    );
  }
}
