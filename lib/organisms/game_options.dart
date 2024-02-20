import 'package:flutter/material.dart';
import 'package:tictactoe/organisms/board_options.dart';
import 'package:tictactoe/organisms/player_options.dart';
import 'package:tictactoe/molecules/select_start_player.dart';

class GameOptions extends StatelessWidget {
  final String player1Text;
  final String player2Text;
  final String player1SelectedMark;
  final String player1SelectedColor;
  final String player2SelectedMark;
  final String player2SelectedColor;
  final String selectedStartPlayer;
  final ValueChanged<String?> onPlayer1MarkChanged;
  final ValueChanged<String?> onPlayer1ColorChanged;
  final ValueChanged<String?> onPlayer2MarkChanged;
  final ValueChanged<String?> onPlayer2ColorChanged;
  final ValueChanged<String?> onStartPlayerChanged;
  final int boardSize;
  final ValueChanged<int> onBoardSizeChanged;
  final int winCondition;
  final ValueChanged<int> onWinConditionChanged;

  const GameOptions({
    required this.player1Text,
    required this.player2Text,
    required this.player1SelectedMark,
    required this.player1SelectedColor,
    required this.player2SelectedMark,
    required this.player2SelectedColor,
    required this.selectedStartPlayer,
    required this.onPlayer1MarkChanged,
    required this.onPlayer1ColorChanged,
    required this.onPlayer2MarkChanged,
    required this.onPlayer2ColorChanged,
    required this.onStartPlayerChanged,
    required this.boardSize,
    required this.onBoardSizeChanged,
    required this.winCondition,
    required this.onWinConditionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlayerOptions(
          playerText: player1Text,
          selectedMark: player1SelectedMark,
          selectedColor: player1SelectedColor,
          onMarkChanged: onPlayer1MarkChanged,
          onColorChanged: onPlayer1ColorChanged,
        ),
        SizedBox(height: 20),
        PlayerOptions(
          playerText: player2Text,
          selectedMark: player2SelectedMark,
          selectedColor: player2SelectedColor,
          onMarkChanged: onPlayer2MarkChanged,
          onColorChanged: onPlayer2ColorChanged,
        ),
        SizedBox(height: 20),
        SelectStartPlayer(
          selectedPlayer: selectedStartPlayer,
          onChanged: onStartPlayerChanged,
        ),
        SizedBox(height: 20),
        BoardOptions(
          boardSize: boardSize,
          onBoardSizeChanged: onBoardSizeChanged,
          winCondition: winCondition,
          onWinConditionChanged: onWinConditionChanged,
        ),
      ],
    );
  }
}