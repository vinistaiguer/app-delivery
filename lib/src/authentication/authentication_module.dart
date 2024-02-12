import 'package:app_chat/src/authentication/pages/delivery_person_register.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/main.dart';

class AuthenticationModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    r.child('/forgot-password', child: (context) => const ForgotPasswordPage());
    r.child('/user-register', child: (context) => const UserRegisterPage());
    r.child('/address-register',
        child: (context) => const AddressRegisterPage());
    r.child('/delivery-person-register',
        child: (context) => const RegisterDeliveryPersonPage());
  }
}
