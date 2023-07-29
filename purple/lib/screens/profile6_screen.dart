import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile6Screen extends StatelessWidget {
  const Profile6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PERPL',
          style: TextStyle(
            color: Color(0xFFBB85FF),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Divider(
              color: Color.fromARGB(255, 230, 230, 230),
            ),
            const SizedBox(height: 5),
            const Text(
              "프로필 작성하기",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff665e72),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            Divider(
              color: Color(0xFFBB85FF),
              thickness: 3.5,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    '수고하셨습니다 !',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF675E72),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '곧 회원님의 맞춤 로드맵이 생성됩니다',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF9882B4),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 230, 230, 230)),
                  ),
                  child: const Text(
                    '이전',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // 구현해야함
                    // Get.to(const Profile4Screen(), arguments: data);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 0,
                  ),
                  child:
                      const Text('다음', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
