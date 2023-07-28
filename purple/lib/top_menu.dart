import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'PERPL',
          style: TextStyle(
            fontFamily: 'PottaOneRegular',
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
