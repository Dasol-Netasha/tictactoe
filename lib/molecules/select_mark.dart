import 'package:flutter/material.dart';
import 'package:tictactoe/atoms/marks/circle.dart';
import 'package:tictactoe/atoms/marks/cross.dart';
import 'package:tictactoe/atoms/marks/square.dart';
import 'package:tictactoe/atoms/marks/star.dart';
import 'package:tictactoe/atoms/marks/triangle.dart';

class SelectMark extends StatelessWidget {
  final String? selectedMark;
  final ValueChanged<String?> onChanged;

  const SelectMark({
    required this.selectedMark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedMark,
      onChanged: onChanged,
      items: [
        DropdownMenuItem(
          value: 'O',
          child: Text('O'),
        ),
        DropdownMenuItem(
          value: 'X',
          child: Text('X'),
        ),
      ],
    );
  }
}