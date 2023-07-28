import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'survey.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 추가
  await dotenv.load(fileName: ".env"); // 추가
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PERPL',
      theme: ThemeData(
        primaryColor: Color(0xFFBB85FF),
      ),
      home: FirstPage(),
    );
  }
}
