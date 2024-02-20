import 'package:flutter/material.dart';
import 'package:tictactoe/pages/home_page.dart';
import 'package:tictactoe/pages/options_page.dart';
// import 'package:tictactoe/pages/history_page.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      routes: {
        '/options': (context) => OptionsPage(), // '/options' 경로에 대한 Route 정의
        // '/records': (context) => HistoryPage(),
      },
      home: HomePage(),
    );
  }
}