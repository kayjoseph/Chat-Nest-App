import 'package:chat_nest/authentication/auth_gate.dart';
import 'package:chat_nest/authentication/login_or_register.dart';
import 'package:chat_nest/firebase_options.dart';
import 'package:chat_nest/pages/splash_screen.dart';
import 'package:chat_nest/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: const SplashScreen(),
    );
  }
}
