import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final List<String> gameResults; // 게임 결과 리스트를 인자로 받음

  HistoryPage({required this.gameResults}); // 생성자 수정

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game History')),
      body: ListView.builder(
        itemCount: widget.gameResults.length, // 전달된 게임 결과 리스트 사용
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Game ${index + 1} Result: ${widget.gameResults[index]}'),
          );
        },
      ),
    );
  }
}