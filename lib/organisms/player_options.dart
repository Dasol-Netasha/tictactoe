import 'package:flutter/material.dart';
import 'package:tictactoe/molecules/select_mark.dart';
import 'package:tictactoe/molecules/select_color.dart';

class PlayerOptions extends StatelessWidget {
  final String playerText;
  final String selectedMark;
  final String selectedColor;
  final ValueChanged<String?> onMarkChanged;
  final ValueChanged<String?> onColorChanged;

  const PlayerOptions({
    required this.playerText,
    required this.selectedMark,
    required this.selectedColor,
    required this.onMarkChanged,
    required this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Player: $playerText'),
        SizedBox(height: 10),
        SelectMark(
          selectedMark: selectedMark,
          onChanged: onMarkChanged,
        ),
        SizedBox(height: 10),
        SelectColor(
          selectedColor: selectedColor,
          onChanged: onColorChanged,
        ),
      ],
    );
  }
}