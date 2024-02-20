import 'package:flutter/material.dart';
import 'package:tictactoe/organisms/game_board.dart';
import 'package:tictactoe/pages/home_page.dart';
import 'package:tictactoe/pages/history_page.dart';

class GamePage extends StatefulWidget {
  final String player1SelectedMark;
  final Color player1SelectedColor;
  final String player2SelectedMark;
  final Color player2SelectedColor;
  final String selectedStartPlayer;
  final int boardSize;
  final int winCondition;

  GamePage({
    required this.player1SelectedMark,
    required this.player1SelectedColor,
    required this.player2SelectedMark,
    required this.player2SelectedColor,
    required this.selectedStartPlayer,
    required this.boardSize,
    required this.winCondition,
  });

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late String currentPlayer;
  late String currentPlayerMark;
  late Color currentPlayerColor;

  @override
  void initState() {
    super.initState();
    currentPlayer = widget.selectedStartPlayer;
    currentPlayerMark = currentPlayer == 'Player 1' ? widget.player1SelectedMark : widget.player2SelectedMark;
    currentPlayerColor = currentPlayer == 'Player 1' ? widget.player1SelectedColor : widget.player2SelectedColor;
  }

  void switchPlayer() {
    setState(() {
      currentPlayer = currentPlayer == 'Player 1' ? 'Player 2' : 'Player 1';
      currentPlayerMark = currentPlayer == 'Player 1' ? widget.player1SelectedMark : widget.player2SelectedMark;
      currentPlayerColor = currentPlayer == 'Player 1' ? widget.player1SelectedColor : widget.player2SelectedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mark: ${currentPlayerMark ?? ''}', style: TextStyle(color: currentPlayerColor)),

            Text(
              'Win Condition: ${widget.winCondition}',
            ),
            SizedBox(height: 20),
            Expanded(
              child: GameBoard(
                size: widget.boardSize,
                player1Mark: widget.player1SelectedMark,
                player1Color: widget.player1SelectedColor,
                player2Mark: widget.player2SelectedMark,
                player2Color: widget.player2SelectedColor,
                onGameEnd: (board) {
                  // 게임이 종료되었을 때 호출되는 콜백
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Game Over'),
                        content: Text('Congratulations! $currentPlayer wins!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage())); // history_page로 이동
                            },
                            child: Text('Restart'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryPage())); // history_page로 이동
                            },
                            child: Text('Record'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}