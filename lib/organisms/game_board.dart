import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  final int size;
  final String player1Mark;
  final Color player1Color;
  final String player2Mark;
  final Color player2Color;
  final Function(List<List<String>>) onGameEnd;

  GameBoard({
    required this.size,
    required this.player1Mark,
    required this.player1Color,
    required this.player2Mark,
    required this.player2Color,
    required this.onGameEnd,
  });

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late List<List<String>> board;
  late String currentPlayer;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    board = List.generate(widget.size, (_) => List.filled(widget.size, ''));
    currentPlayer = widget.player1Mark;
    gameOver = false;
  }

  bool checkWinner(String mark) {
    // 가로, 세로, 대각선으로 승리 조건 확인
    for (int i = 0; i < widget.size; i++) {
      bool winRow = true;
      bool winCol = true;
      for (int j = 0; j < widget.size; j++) {
        if (board[i][j] != mark) winRow = false;
        if (board[j][i] != mark) winCol = false;
      }
      if (winRow || winCol) return true;
    }

    bool winDiagonal1 = true;
    bool winDiagonal2 = true;
    for (int i = 0; i < widget.size; i++) {
      if (board[i][i] != mark) winDiagonal1 = false;
      if (board[i][widget.size - 1 - i] != mark) winDiagonal2 = false;
    }

    return winDiagonal1 || winDiagonal2;
  }

  void onCellTap(int row, int col) {
    if (gameOver || board[row][col].isNotEmpty) return;

    setState(() {
      board[row][col] = currentPlayer;

      if (checkWinner(currentPlayer)) {
        gameOver = true;
        widget.onGameEnd(board);
      } else if (board.every((row) => row.every((cell) => cell.isNotEmpty))) {
        // 모든 셀이 채워졌으나 승리자가 없을 때 무승부 처리
        gameOver = true;
        widget.onGameEnd(board);
      } else {
        // 플레이어 교체
        currentPlayer = currentPlayer == widget.player1Mark
            ? widget.player2Mark
            : widget.player1Mark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.size,
      ),
      itemCount: widget.size * widget.size,
      itemBuilder: (context, index) {
        int row = index ~/ widget.size;
        int col = index % widget.size;
        String cellValue = board[row][col];

        return GestureDetector(
          onTap: () => onCellTap(row, col),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Center(
              child: Text(
                cellValue,
                style: TextStyle(
                  fontSize: 24,
                  color: cellValue == widget.player1Mark ? widget.player1Color : widget.player2Color,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GamePage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Player 1 Mark: $player1SelectedMark',
            ),
            Text(
              'Player 1 Color: $player1SelectedColor',
            ),
            Text(
              'Player 2 Mark: $player2SelectedMark',
            ),
            Text(
              'Player 2 Color: $player2SelectedColor',
            ),
            Text(
              'Starting Player: $selectedStartPlayer',
            ),
            Text(
              'Board Size: $boardSize x $boardSize',
            ),
            Text(
              'Win Condition: $winCondition',
            ),
            SizedBox(height: 20),
            Expanded(
              child: GameBoard(
                size: boardSize,
                player1Mark: player1SelectedMark,
                player1Color: player1SelectedColor,
                player2Mark: player2SelectedMark,
                player2Color: player2SelectedColor,
                onGameEnd: (board) {
                  // 게임이 종료되었을 때 호출되는 콜백
                  // 여기에 게임 종료 후의 동작 추가
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Game Over'),
                        content: Text('Congratulations! $selectedStartPlayer wins!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Restart'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
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