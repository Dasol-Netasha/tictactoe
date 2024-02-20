import 'package:flutter/material.dart';

class CircleMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
    );
  }
}