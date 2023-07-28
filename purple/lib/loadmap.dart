import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

var apiKey = dotenv.env['apiKey'];
var apiUrl = dotenv.env['apiUrl'];

class ResultPage extends StatelessWidget {
  final String result;
  final String prompt1;

  ResultPage(this.result, this.prompt1);

  @override
  Widget build(BuildContext context) {
    // Split the GPT-3 response into lines
    List<String> lines =
        result.split('\n').where((line) => line.trim().isNotEmpty).toList();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: lines.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ClipOval(
                      child: Material(
                        color: Colors.purple, // Set the button color to purple
                        child: InkWell(
                          onTap: () async {
                            String prom = lines[index];
                            String result2 = await generateText2(prom, prompt1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LineDetailPage(result2),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              lines[index]
                                  .toString(), // lines[index]를 정수로 변환하여 표시
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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

Future<String> generateText2(String prompt, String prompt1) async {
  String prom = "";
  if (prompt.contains("자격증")) {
    prom = "$prompt1 직종 관련 한국 자격증을 알려줘.";
  } else {
    prom = "$prompt 를 하려는데 알려줘. 근데 오타없이 키워드만 간단히.";
  }
  final response = await http.post(
    Uri.parse(apiUrl!),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    },
    body: jsonEncode({
      "model": "text-davinci-003",
      'prompt': prom,
      'max_tokens': 1000,
      'temperature': 0,
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0
    }),
  );
  developer.log('log me', name: 'my.app.category');

  developer.log('$prompt', name: 'my.app.category');

  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['text'];
}

Future<String> generateText3(String prompt) async {
  final response = await http.post(
    Uri.parse(apiUrl!),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    },
    body: jsonEncode({
      "model": "text-davinci-003",
      'prompt': "$prompt 를 하려는데 추천 책과 강의 영상을 알려줘! 근데 오타 없이 키워드만 간단히.",
      'max_tokens': 1000,
      'temperature': 0,
      'top_p': 1,
      'frequency_penalty': 0,
      'presence_penalty': 0
    }),
  );

  developer.log('log me', name: 'my.app.category');

  developer.log('$prompt', name: 'my.app.category');

  Map<String, dynamic> newresponse =
      jsonDecode(utf8.decode(response.bodyBytes));

  return newresponse['choices'][0]['text'];
}
