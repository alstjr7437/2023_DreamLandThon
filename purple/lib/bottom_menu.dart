import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              // 저장 아이콘
              Icons.save_alt_rounded,
              size: 25,
            ),
            // 캘린더
            Icon(
              Icons.calendar_month_rounded,
              size: 25,
            ),
            // 홈
            Icon(
              Icons.home,
              size: 25,
            ),
            // 후기
            Icon(
              Icons.note_add_rounded,
              size: 25,
            ),
            // 마이페이지
            Icon(
              Icons.person,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
