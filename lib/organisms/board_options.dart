import 'package:flutter/material.dart';
import 'package:tictactoe/molecules/select_board_size.dart';
import 'package:tictactoe/molecules/select_win_condition.dart';

class BoardOptions extends StatelessWidget {
  final int boardSize;
  final int winCondition;
  final ValueChanged<int> onBoardSizeChanged;
  final ValueChanged<int> onWinConditionChanged;

  const BoardOptions({
    required this.boardSize,
    required this.winCondition,
    required this.onBoardSizeChanged,
    required this.onWinConditionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectBoardSize(
          boardSize: boardSize,
          onChanged: onBoardSizeChanged,
        ),
        SizedBox(height: 20),
        SelectWinCondition(
          winCondition: winCondition,
          onChanged: onWinConditionChanged,
        ),
      ],
    );
  }
}