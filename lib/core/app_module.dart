import 'package:flutter_modular/flutter_modular.dart';

import '../src/authentication/authentication_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: AuthenticationModule());
  }
}
