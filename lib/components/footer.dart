import 'package:flutter/material.dart';

//footer.dart
double footerFontSize = 12; //footer 폰트 크기
double footerHeight = 200; //footer 높이

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
          color: const Color(0xFF161C2A), // 검정색 배경색
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
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/logos/white_logo.png', // 이미지 파일 경로
                  width: 130, // 이미지 너비
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '경기도 성남시 수정구 성남대로 1324, AI공학관', // 주소 추가
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white, // 폰트 색상을 흰색으로 변경
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Phone: 010-9996-2407',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white, // 폰트 색상을 흰색으로 변경
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Email: info@aiia.com',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white, // 폰트 색상을 흰색으로 변경
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      '© 2023 AIIA. All Rights Reserved.', // 저작권 문구 추가
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
