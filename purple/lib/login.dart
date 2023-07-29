import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 8,
            ),
            child: Text(
              'PERPL',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PottaOneRegular',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        body: Center(
          child: Text(
            'PERPL',
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
