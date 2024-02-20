import 'package:flutter/material.dart';

class SelectBoardSize extends StatelessWidget {
  final int boardSize;
  final ValueChanged<int> onChanged;

  const SelectBoardSize({
    required this.boardSize,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Board Size: $boardSize'),
        Slider(
          value: boardSize.toDouble(),
          min: 3,
          max: 10,
          divisions: 7,
          label: boardSize.toString(),
          onChanged: (double value) {
            onChanged(value.toInt());
          },
        ),
      ],
    );
  }
}