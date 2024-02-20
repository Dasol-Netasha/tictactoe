import 'package:flutter/material.dart';

class SelectStartPlayer extends StatelessWidget {
  final String? selectedPlayer;
  final ValueChanged<String?> onChanged;

  const SelectStartPlayer({
    required this.selectedPlayer,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Start Player',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Radio<String>(
              value: 'Player 1',
              groupValue: selectedPlayer,
              onChanged: onChanged,
            ),
            Text('Player 1'),
            Radio<String>(
              value: 'Player 2',
              groupValue: selectedPlayer,
              onChanged: onChanged,
            ),
            Text('Player 2'),
          ],
        ),
      ],
    );
  }
}