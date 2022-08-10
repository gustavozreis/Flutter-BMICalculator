import 'dart:ffi';

import 'package:flutter/material.dart';

class DividedBox extends StatelessWidget {
  DividedBox({Key? key, required this.color, this.cardChild, this.onPress})
      : super(key: key);

  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 200.0,
        width: 150.0,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
