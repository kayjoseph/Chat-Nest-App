import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final String imagePath;
  const AppLogo({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 200,
      width: 200,
    );
  }
}