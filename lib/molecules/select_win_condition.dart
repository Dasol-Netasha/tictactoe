import 'package:flutter/material.dart';

class SelectWinCondition extends StatelessWidget {
  final int winCondition;
  final ValueChanged<int> onChanged;

  const SelectWinCondition({
    required this.winCondition,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Win Condition: $winCondition'),
        Slider(
          value: winCondition.toDouble(),
          min: 3,
          max: 10,
          divisions: 7,
          label: winCondition.toString(),
          onChanged: (double value) {
            onChanged(value.toInt());
          },
        ),
      ],
    );
  }
}