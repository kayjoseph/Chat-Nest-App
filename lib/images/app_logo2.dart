import 'package:flutter/material.dart';

class appLogo extends StatelessWidget {
  final String imagePath;
  const appLogo({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 130,
      width: 140,
    );
  }
}