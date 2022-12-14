import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 75.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextStyle,
        ),
      ],
    );
  }
}
