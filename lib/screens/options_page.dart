import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/player_options.dart';
import 'package:tictactoe/screens/game_page.dart';

class OptionsPage extends StatefulWidget {
  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  int boardSize = 3; // 보드의 기본 크기
  String player1Mark = 'O'; // Player 1의 기본 마크
  Color player1Color = Colors.red; // Player 1의 기본 색상
  String player2Mark = 'X'; // Player 2의 기본 마크
  Color player2Color = Colors.blue; // Player 2의 기본 색상

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game Options')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBoardSizeDropdown(),
            SizedBox(height: 20), // 보드 크기와 플레이어 옵션 사이 간격 추가
            PlayerOptionsWidget(
              mark: player1Mark,
              color: player1Color,
              label: 'Player 1',
              onMarkChanged: (String newMark) {
                setState(() {
                  player1Mark = newMark;
                });
              },
              onColorChanged: (Color newColor) {
                setState(() {
                  player1Color = newColor;
                });
              },
              otherMarks: [player2Mark], // 다른 플레이어의 mark 목록 설정
              otherColors: [player2Color], // 다른 플레이어의 color 목록 설정
            ),
            SizedBox(height: 20), // 플레이어 1 옵션과 플레이어 2 옵션 사이 간격 추가
            PlayerOptionsWidget(
              mark: player2Mark,
              color: player2Color,
              label: 'Player 2',
              onMarkChanged: (String newMark) {
                setState(() {
                  player2Mark = newMark;
                });
              },
              onColorChanged: (Color newColor) {
                setState(() {
                  player2Color = newColor;
                });
              },
              otherMarks: [player1Mark], // 다른 플레이어의 mark 목록 설정
              otherColors: [player1Color], // 다른 플레이어의 color 목록 설정
            ),
            SizedBox(height: 20), // 플레이어 옵션과 확인 버튼 사이 간격 추가
            ElevatedButton(
              onPressed: () {
                // Start Game 버튼 클릭 시 GamePage로 이동하고 설정한 옵션들을 함께 전달
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GamePage(
                      boardSize: boardSize,
                      player1Mark: player1Mark,
                      player1Color: player1Color,
                      player2Mark: player2Mark,
                      player2Color: player2Color,
                    ),
                  ),
                );
              },
              child: Text('Start Game'), // 버튼 텍스트를 Start Game으로 변경
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoardSizeDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Board Size: ', style: TextStyle(fontSize: 16)),
        DropdownButton<int>(
          value: boardSize,
          onChanged: (int? newValue) {
            if (newValue != null) {
              setState(() {
                boardSize = newValue;
              });
            }
          },
          items: List.generate(10, (index) => index + 1) // 1부터 10까지의 보드 크기 옵션 생성
              .map((int size) {
            return DropdownMenuItem<int>(
              value: size,
              child: Text(size.toString()),
            );
          }).toList(),
        ),
      ],
    );
  }
}