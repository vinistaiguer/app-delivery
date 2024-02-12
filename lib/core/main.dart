// import 'package:firebase_core/firebase_core.dart';
import 'package:app_chat/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: TaguaTheme.getTheme(),
      title: 'Tagua App',
      routerConfig: Modular.routerConfig,
    );
  }
}
