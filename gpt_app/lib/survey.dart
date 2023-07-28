import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

var apiKey = dotenv.env['apiKey'];
var apiUrl = dotenv.env['apiUrl'];

class FirstPage extends StatelessWidget {
  final TextEditingController _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIT: What Is That?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller1,
            decoration: InputDecoration(hintText: "희망 직종"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(_controller1.text),
                ),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String prompt1;
  final TextEditingController _controller2 = TextEditingController();

  SecondPage(this.prompt1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIT: What Is That?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller2,
            decoration: InputDecoration(hintText: "전공유무 ex) 전공자 or 비전공자"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdPage(prompt1, _controller2.text),
                ),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  final String prompt1;
  final String prompt2;
  final TextEditingController _controller3 = TextEditingController();

  ThirdPage(this.prompt1, this.prompt2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIT: What Is That?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller3,
            decoration: InputDecoration(hintText: "최종학력 (대학교) ex) 재학중 or 졸업"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FourthPage(prompt1, prompt2, _controller3.text),
                ),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  final String prompt1;
  final String prompt2;
  final String prompt3;
  final TextEditingController _controller4 = TextEditingController();

  FourthPage(this.prompt1, this.prompt2, this.prompt3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIT: What Is That?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller4,
            decoration: InputDecoration(hintText: "경력 유무 ex) 0년 or 6개월 or 1년"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FifthPage(prompt1, prompt2, prompt3, _controller4.text),
                ),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}

class FifthPage extends StatelessWidget {
  final String prompt1;
  final String prompt2;
  final String prompt3;
  final String prompt4;
  final TextEditingController _controller5 = TextEditingController();

  FifthPage(this.prompt1, this.prompt2, this.prompt3, this.prompt4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIT: What Is That?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller5,
            decoration:
                InputDecoration(hintText: "자격증 유무 ex) 가지고 있는 자격증 이름 or 없음"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SixthPage(
                      prompt1, prompt2, prompt3, prompt4, _controller5.text),
                ),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}

class SixthPage extends StatelessWidget {
  final String prompt1;
  final String prompt2;
  final String prompt3;
  final String prompt4;
  final String prompt5;
  final TextEditingController _controller6 = TextEditingController();

  SixthPage(
      this.prompt1, this.prompt2, this.prompt3, this.prompt4, this.prompt5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIT: What Is That?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller6,
            decoration: InputDecoration(hintText: "수상경력 ex) 공모전 수상 or 없음"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeventhPage(prompt1, prompt2, prompt3,
                      prompt4, prompt5, _controller6.text),
                ),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}

class SeventhPage extends StatelessWidget {
  final String prompt1;
  final String prompt2;
  final String prompt3;
  final String prompt4;
  final String prompt5;
  final String prompt6;
  final TextEditingController _controller7 = TextEditingController();

  SeventhPage(this.prompt1, this.prompt2, this.prompt3, this.prompt4,
      this.prompt5, this.prompt6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WIT: What Is That?"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller7,
            decoration: InputDecoration(
                hintText: "어학점수 ex) 토익 00점 or 오픽 00등급 or 없음 등 "),
          ),
          TextButton(
            onPressed: () async {
              String prompt7 = _controller7.text;

              String combinedPrompt =
                  "난 $prompt1이게 되고 싶어, 난 $prompt2 이야, 내 학력은 대학교 $prompt3 이야, 내 $prompt1 에 대한 경력은 $prompt4 이야. 난 가지고 있는 자격증이 $prompt5 이야. 내 수상 경력은 $prompt6이야. 내 어학 점수는 $prompt7이야.";
              String result = await generateText(combinedPrompt);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(result),
                ),
              );
            },
            child: Text("Get Result"),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String result;

  ResultPage(this.result);

  @override
  Widget build(BuildContext context) {
    // Split the GPT-3 response into lines

    developer.log('log me', name: 'my.app.category');
    developer.log('$result', name: 'my.app.category');
    List<String> lines =
        result.split('\n').where((line) => line.trim().isNotEmpty).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("$result"),
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LineDetailPage(lines[index]),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: 56,
                            height: 56,
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
        title: Text("Line Detail"),
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
    );
  }
}

Future<String> generateText(String prompt) async {
  final response = await http.post(
    Uri.parse(apiUrl!),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    },
    body: jsonEncode({
      "model": "text-davinci-003",
      'prompt': "$prompt 이런 나를 위해서 로드맵 순서를 정해서 알려줘. 근데 오타없이 키워드만 간단히.",
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
