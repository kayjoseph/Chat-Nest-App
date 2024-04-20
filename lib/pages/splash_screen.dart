import 'package:chat_nest/authentication/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:chat_nest/images/app_logo.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthGate()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF34BC45),
      body: Container(
        width: double.infinity,
        color: const Color(0xFF34BC45),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(imagePath: "lib/images/app_logo.jpg"),
          ],
        ),
      ),
    );
  }
}
