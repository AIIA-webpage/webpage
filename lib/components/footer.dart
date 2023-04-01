import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';

//footer.dart
double footerFontSize = 12; //footer 폰트 크기
double footerHeight = 180; //footer 높이

GlobalKey footerKey = GlobalKey();

class Footer extends StatelessWidget {
  const Footer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).size.height > footerHeight,
      child: Container(
        key: footerKey,
        height: footerHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black, // 검정색 배경색
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logos/logo_nav2.png', // 이미지 파일 경로
                  height: 50, // 이미지 높이
                  width: 50, // 이미지 너비
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Address: 123 Main St, New York, NY 10001', // 주소 추가
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white, // 폰트 색상을 흰색으로 변경
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Phone: 123-456-7890',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white, // 폰트 색상을 흰색으로 변경
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Email: info@aiia.com',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white, // 폰트 색상을 흰색으로 변경
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '©2023 AIIA. All Rights Reserved.', // 저작권 문구 추가
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white, // 폰트 색상을 흰색으로 변경
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
