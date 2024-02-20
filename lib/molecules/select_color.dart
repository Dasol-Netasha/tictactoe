import 'package:flutter/material.dart';

class SelectColor extends StatelessWidget {
  final String? selectedColor;
  final ValueChanged<String?> onChanged;

  const SelectColor({
    required this.selectedColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedColor,
      onChanged: onChanged,
      items: <String>[
        'red',
        'orange',
        'yellow',
        'green',
        'blue',
        'purple',
        'black',
      ].map((String color) {
        return DropdownMenuItem<String>(
          value: color,
          child: Text(color),
        );
      }).toList(),
    );
  }
}