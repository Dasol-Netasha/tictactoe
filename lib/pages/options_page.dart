import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tictactoe/organisms/game_options.dart';
import 'package:tictactoe/pages/game_page.dart';

Color getColorFromString(String colorString) {
  switch (colorString.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'green':
      return Colors.green;
    case 'blue':
      return Colors.blue;
    case 'yellow':
      return Colors.yellow;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'black':
      return Colors.black;
    default:
      return Colors.black; // 기본값으로 검은색 반환
  }
}
class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  String player1SelectedMark = 'X'; // Player 1의 마크 초기값 설정
  String player1SelectedColor = 'red'; // Player 1의 색상 초기값 설정
  String player2SelectedMark = 'O'; // Player 2의 마크 초기값 설정
  String player2SelectedColor = 'blue'; // Player 2의 색상 초기값 설정
  String selectedStartPlayer = 'Player 1'; // 시작 플레이어 초기값 설정
  int boardSize = 3; // 보드 사이즈 초기값 설정
  int winCondition = 3; // 승리 조건 초기값 설정
  @override
  @override
  void initState() {
    super.initState();
    // 랜덤 시작 플레이어를 설정
    setRandomStartPlayer();
  }
  void setRandomStartPlayer() {
    // 랜덤 값을 생성
    final random = Random();
    final randomIndex = random.nextInt(2);

    // randomIndex에 따라 시작 플레이어를 설정
    setState(() {
      selectedStartPlayer = randomIndex == 0 ? 'Player 1' : 'Player 2';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Options'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GameOptions(
            player1Text: 'Player 1',
            player2Text: 'Player 2',
            player1SelectedMark: player1SelectedMark, // 변경된 값 전달
            player1SelectedColor: player1SelectedColor,
            player2SelectedMark: player2SelectedMark,
            player2SelectedColor: player2SelectedColor,
            selectedStartPlayer: selectedStartPlayer,
            onPlayer1MarkChanged: (mark) {
              if (mark != player2SelectedMark) { // 다른 플레이어와 겹치지 않는지 확인
                setState(() {
                  player1SelectedMark = mark!;
                });
                print('Player 1의 마크가 변경됨: $mark');
              } else {
                print('Player 1과 Player 2의 마크는 같을 수 없습니다.');
              }
            },
            onPlayer1ColorChanged: (color) {
              setState(() {
                player1SelectedColor = color!;
              });
              print('Player 1의 색상이 변경됨: $color');
            },
            onPlayer2MarkChanged: (mark) {
              // Player 2의 마크가 변경될 때 호출되는 콜백
              if (mark != player1SelectedMark) { // 다른 플레이어와 겹치지 않는지 확인
                setState(() {
                  player2SelectedMark = mark!;
                });
                print('Player 2의 마크가 변경됨: $mark');
              } else {
                print('Player 2와 Player 1의 마크는 같을 수 없습니다.');
              }
            },
            onPlayer2ColorChanged: (color) {
              setState(() {
                player2SelectedColor = color!;
              });
              print('Player 2의 색상이 변경됨: $color');
            },
            onStartPlayerChanged: (player) {
              setState(() {
                selectedStartPlayer = player!;
              });
              print('시작 플레이어가 변경됨: $player');
            },
            boardSize: boardSize,
            onBoardSizeChanged: (size) {
              // 보드 사이즈가 변경될 때 호출되는 콜백
              if (size >= 3 && size <= 10) { // 최소값과 최대값 사이인지 확인
                setState(() {
                  boardSize = size;
                  if (winCondition > size) { // 승리 조건이 보드 사이즈를 초과하지 않도록 조정
                    winCondition = size;
                  }
                });
                print('보드 사이즈가 변경됨: $size');
              } else {
                print('보드 사이즈는 최소 3에서 최대 10까지 가능합니다.');
              }
            },
            winCondition: winCondition,
            onWinConditionChanged: (condition) {
              // 승리 조건이 변경될 때 호출되는 콜백
              if (condition >= 3 && condition <= boardSize) { // 최소값과 최대값 사이인지 확인
                setState(() {
                  winCondition = condition;
                });
                print('승리 조건이 변경됨: $condition');
              } else {
                print('승리 조건은 최소 3에서 최대 $boardSize 까지 가능합니다.');
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePage(
                player1SelectedMark: player1SelectedMark,
                player1SelectedColor: getColorFromString(player1SelectedColor),
                player2SelectedMark: player2SelectedMark,
                player2SelectedColor: getColorFromString(player2SelectedColor),
                selectedStartPlayer: selectedStartPlayer,
                boardSize: boardSize,
                winCondition: winCondition,
              ),
            ),
          );
        },
        child: Text('Start Game'),
      ),

    );
  }
}