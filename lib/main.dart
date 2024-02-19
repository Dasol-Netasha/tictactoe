import 'package:flutter/material.dart';
import 'package:tictactoe/screens/home_page.dart';
import 'package:tictactoe/screens/options_page.dart';
// import 'package:tictactoe/screens/history_page.dart';

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