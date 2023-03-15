import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';

GlobalKey footerKey = GlobalKey();

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(7),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Colors.grey.shade300),
      child: Text(
        '가천대학교 글로벌 캠퍼스 교내 자율 동아리, AIIA입니다.\n'
        '비즈니스 문의 : aiia.lab.official@gmail.com\n'
        '© 2023 AIIA, All Rights Reserved.',
        style: TextStyle(
          fontSize: footerFontSize,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
