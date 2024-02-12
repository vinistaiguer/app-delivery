import 'package:app_chat/src/authentication/components/login_image_logo.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  late PinTheme currentPinTheme;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const textForgotPassword = Color(0xFF4F4F4F);
    const borderColor = Color(0xFFD4AE01);
    const focusedBorderColor = Color(0xFFD4AE01);
    const focusedBorderColorSuccess = Color.fromARGB(255, 43, 255, 0);

    const fillColor = Color.fromARGB(255, 230, 222, 187);

    // bool isCodeValid = false;

    PinTheme defaultPinTheme = PinTheme(
      width: 70,
      height: 80,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color(0xFFD4AE01),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: borderColor,
          width: 4.0,
        ),
      ),
    );

    final validPinTheme = PinTheme(
      width: 70,
      height: 80,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 43, 255, 0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: focusedBorderColorSuccess,
          width: 4.0,
        ),
      ),
    );

    // @override
    // void initState() {
    //   super.initState();
    //   currentPinTheme = defaultPinTheme;
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0,
                        -76), // Define a quantidade de movimento em pixels (x, y)
                    child: const LoginImageLogo(),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: Text(
                      'Esqueci Minha Senha',
                      style: TextStyle(
                        color: textForgotPassword,
                        fontFamily: 'Popings',
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Text(
                      'Insira o código para redefinir sua senha',
                      style: TextStyle(
                        color: textForgotPassword,
                        fontFamily: 'Popings',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      controller: pinController,
                      focusNode: focusNode,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      defaultPinTheme: defaultPinTheme,
                      onSubmitted: (value) {},
                      separatorBuilder: (index) => const SizedBox(width: 16),
                      validator: (value) {
                        return value == '2222' ? null : 'Pin is incorrect';
                      },
                      onClipboardFound: (value) {
                        debugPrint('onClipboardFound: $value');
                        pinController.setText(value);
                      },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(
                            color: focusedBorderColor,
                            width: 4.0,
                          ),
                        ),
                      ),
                      submittedPinTheme: validPinTheme.copyWith(
                        decoration: validPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(
                            color: focusedBorderColorSuccess,
                            width: 4.0,
                          ),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(
                          color: Colors.redAccent,
                          width: 4.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextButton(
                      onPressed: () {
                        focusNode.unfocus();
                        formKey.currentState!.validate();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFD4AE01),
                        padding: const EdgeInsets.fromLTRB(129, 10, 129, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Text(
                        'Validar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
