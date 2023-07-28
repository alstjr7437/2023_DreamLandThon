import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PERPL',
          style: TextStyle(
            fontFamily: 'PottaOneRegular',
          ),
        ),
      ),
    );
  }
}
