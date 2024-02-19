import 'package:flutter/material.dart';

class PlayerOptionsWidget extends StatelessWidget {
  final String mark;
  final Color color;
  final String label;
  final ValueChanged<String> onMarkChanged;
  final ValueChanged<Color> onColorChanged;
  final List<String> otherMarks; // 다른 플레이어의 mark 목록
  final List<Color> otherColors; // 다른 플레이어의 color 목록

  PlayerOptionsWidget({
    required this.mark,
    required this.color,
    required this.label,
    required this.onMarkChanged,
    required this.onColorChanged,
    required this.otherMarks,
    required this.otherColors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$label Options',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mark: ', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: mark,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  if (!otherMarks.contains(newValue)) {
                    onMarkChanged(newValue);
                  } else {
                    // 선택한 마크가 다른 플레이어의 마크와 겹칠 경우 에러 처리
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Selected mark is already in use.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              items: ['O', 'X', 'ㅁ'] // 마크 옵션 설정
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Color: ', style: TextStyle(fontSize: 16)),
            DropdownButton<Color>(
              value: color,
              onChanged: (Color? newValue) {
                if (newValue != null) {
                  if (!otherColors.contains(newValue)) {
                    onColorChanged(newValue);
                  } else {
                    // 선택한 색상이 다른 플레이어의 색상과 겹칠 경우 에러 처리
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Selected color is already in use.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              items: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.purple
              ] // 색상 옵션 설정
                  .map((Color value) {
                return DropdownMenuItem<Color>(
                  value: value,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: value,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}