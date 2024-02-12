import 'package:app_chat/src/authentication/components/register_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/palette.dart';
import '../../shared/components/input_field.dart';

class UserRegisterPage extends StatefulWidget {
  const UserRegisterPage({super.key});

  @override
  State<UserRegisterPage> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const RegisterHeader(title: 'Cadastro'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  controller: TextEditingController(),
                  labelText: 'Nome Completo',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  labelText: 'E-mail',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  labelText: 'Telefone',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  labelText: 'Senha',
                ),
                const SizedBox(height: 16),
                InputField(
                  controller: TextEditingController(),
                  labelText: 'Confirmar senha',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 210,
            child: Stack(
              children: [
                Positioned(
                  right: 16,
                  top: 16,
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Modular.to.pushNamed('/address-register');
                              },
                              child: const Icon(Icons.arrow_forward_ios)),
                        ),
                        const SizedBox(height: 5),
                        Text('Cadastre o endereço',
                            style: Theme.of(context).textTheme.labelSmall)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: -10,
                  child: SizedBox(
                    height: 280,
                    width: 280,
                    child: Image.asset(
                      'assets/whiskyHand2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                    bottom: 16,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        'É motoboy e quer entregar para a Tagua? ',
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                                TextSpan(
                                  text: 'Cadastre-se',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: Palette.primary,
                                        decoration: TextDecoration.underline,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Modular.to.pushNamed(
                                          '/delivery-person-register');
                                    },
                                ),
                              ])),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
