import 'package:flutter/material.dart';
import 'package:tictactoe/screens/history_page.dart';

class GamePage extends StatefulWidget {
  final String player1Mark;
  final String player2Mark;
  final Color player1Color;
  final Color player2Color;
  final int boardSize;

  GamePage({
    required this.player1Mark,
    required this.player2Mark,
    required this.player1Color,
    required this.player2Color,
    required this.boardSize,
  });

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late List<List<String>> gameBoard;
  late bool player1Turn;
  bool gameEnded = false;
  List<String> gameResults = []; // 게임 결과를 저장하는 리스트

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    // 게임 보드 초기화
    gameBoard = List.generate(widget.boardSize, (_) => List.filled(widget.boardSize, ''));
    // 플레이어 1부터 게임 시작
    player1Turn = true;
    gameEnded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 게임 보드 표시
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.boardSize,
              ),
              itemCount: widget.boardSize * widget.boardSize,
              itemBuilder: (context, index) {
                int row = index ~/ widget.boardSize;
                int col = index % widget.boardSize;
                return GestureDetector(
                  onTap: () {
                    if (!gameEnded && gameBoard[row][col] == '') {
                      setState(() {
                        // 플레이어 턴에 따라 마크를 설정
                        gameBoard[row][col] = player1Turn
                            ? widget.player1Mark
                            : widget.player2Mark;
                        // 다음 플레이어의 차례로 변경
                        player1Turn = !player1Turn;
                        // 게임 종료 여부 확인
                        if (checkWinner() || isBoardFull()) {
                          gameEnded = true;
                          _showResultDialog();
                        }
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        gameBoard[row][col],
                        style: TextStyle(
                          fontSize: 24,
                          color: gameBoard[row][col] == widget.player1Mark
                              ? widget.player1Color
                              : gameBoard[row][col] == widget.player2Mark
                              ? widget.player2Color
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // 게임 종료 여부를 확인하는 함수
  bool checkWinner() {
    // 가로줄 검사
    for (int i = 0; i < widget.boardSize; i++) {
      if (gameBoard[i][0] == gameBoard[i][1] &&
          gameBoard[i][1] == gameBoard[i][2] &&
          gameBoard[i][0] != '') {
        return true;
      }
    }
    // 세로줄 검사
    for (int i = 0; i < widget.boardSize; i++) {
      if (gameBoard[0][i] == gameBoard[1][i] &&
          gameBoard[1][i] == gameBoard[2][i] &&
          gameBoard[0][i] != '') {
        return true;
      }
    }
    // 대각선 검사
    if (gameBoard[0][0] == gameBoard[1][1] &&
        gameBoard[1][1] == gameBoard[2][2] &&
        gameBoard[0][0] != '') {
      return true;
    }
    if (gameBoard[0][2] == gameBoard[1][1] &&
        gameBoard[1][1] == gameBoard[2][0] &&
        gameBoard[0][2] != '') {
      return true;
    }
    // 게임 보드가 모두 채워졌는지 확인
    return isBoardFull();
  }

// 모든 칸이 채워졌는지 확인하는 함수
  bool isBoardFull() {
    for (int i = 0; i < widget.boardSize; i++) {
      for (int j = 0; j < widget.boardSize; j++) {
        if (gameBoard[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  // 게임 결과 팝업을 표시하는 함수
  // 게임 결과를 기록하고 팝업을 표시하는 함수
  Future<void> _showResultDialog() async {
    String result = checkWinner() ? 'Player ${player1Turn ? 2 : 1} Wins' : 'Draw!';
    gameResults.add(result); // 결과를 게임 기록에 추가
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text(result),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  initializeGame(); // 게임 다시 시작
                });
              },
              child: Text('Restart'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(gameResults: gameResults),
                  ),
                );
              },
              child: Text('Record'),
            ),
          ],
        );
      },
    );
  }
}