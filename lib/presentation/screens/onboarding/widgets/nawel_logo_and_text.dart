import 'package:flutter/material.dart';

class NawelLogoAndText extends StatelessWidget {
  const NawelLogoAndText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 0, right: 50),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/nawel.png', width: 300, height: 300),
          ],
        ),
      ),
    );
  }
}
