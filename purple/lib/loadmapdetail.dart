import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

class LineDetailPage extends StatelessWidget {
  final String lineContent;

  LineDetailPage(this.lineContent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'PERPL',
            style: TextStyle(
              fontFamily: 'PottaOneRegular',
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            lineContent,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
