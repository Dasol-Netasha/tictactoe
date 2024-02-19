import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final int size;
  final String player1Mark;
  final Color player1Color;
  final String player2Mark;
  final Color player2Color;

  GameBoard({
    required this.size,
    required this.player1Mark,
    required this.player1Color,
    required this.player2Mark,
    required this.player2Color,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size,
      ),
      itemCount: size * size,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // 게임 보드의 각 셀을 클릭했을 때의 동작 구현
            print('Cell $index clicked');
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Center(
              child: Text(
                '', // 각 셀의 텍스트는 비어있음
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
    );
  }
}