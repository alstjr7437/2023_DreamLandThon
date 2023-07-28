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
              Icons.star,
              size: 25,
            ),
            Icon(
              Icons.accessible,
              size: 25,
            ),
            Icon(
              Icons.contact_mail,
              size: 25,
            ),
            Icon(
              Icons.contact_mail,
              size: 25,
            ),
            Icon(
              Icons.contact_mail,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
