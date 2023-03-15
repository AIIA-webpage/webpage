//선언시 할당된 값은 웹페이지 기준.

//all
import 'package:flutter/material.dart';

double title = 50; //페이지 최상단 Members, Contents, AIIA News 등 타이틀의 폰트 크기
bool isWeb = true; //웹브라우저인지 모바일인지 판별. true : 웹 / false : 모바일
double pageHeight = 100;
double pageWidth = 100;

//
//components
//navigation_bar.dart
double fontSize = 20; //메뉴 하나(Main, members, contents, News)의 폰트 크기
double space = 0;
double highLightSize = 120; //선택된 메뉴 하단에 생기는 하이라이트 박스의 크기
double imageWidth = 120; // AIIA 돌고래, 텍스트 로고의 크기
double h = 60; //네비게이션 바 전체의 세로 높이

//footer.dart
double footerFontSize = 12; //footer 폰트 크기

//
//pages
//aiia_intro.dart
double aiia1FontSize = 90; //AIIA 폰트 크기.
double aiia2FontSize = 60; //Artificial Intelligence In Actions 폰트 크기
double logoSize = 500; //남색배경 돌고래 로고의 크기
double contentsFontSize = 21; //남색배경 본문 긴 글의 폰트 크기
double contentsTextWidth = 1200; //남색배경 본문 텍스트박스 크기. 1200으로 초기화

//members.dart
double groupName = 50; //그룹명(captin, co-pilot, ...)의 폰트 크기
double profileSize = 65; //구성원 사진의 크기
double nameSize = 25; //구성원 이름의 크기
double card = 240; //플립 카드의 너비
double majorFont = 20; //전공 폰트 크기

//contents.dart
double listWidth = 780; //contents 상단 네모 목록의 너비
double listSpace = 40; //contents 상단 네모 목록의 너비
double listTitle = 25; //contents 상단 목록의 각 타이틀
double listExplanation = 15; //contents 상단 목록의 각 설명
double subTitleFont = 50; //6개 각 주제의 타이틀 폰트 크기

//nakalicoubae.dart
double activityWidth = 1000;

//post_builder.dart
double titleSize = 50; //News 각 게시물 화면의 타이틀 폰트 크기
double postWidth = 1000;

void getSize(var responsiveWidth, var responsiveHeight) {
  pageWidth = responsiveWidth;
  pageHeight = responsiveHeight;
  if (responsiveWidth > 2000) {
    //all
    title = 50;
    isWeb = true;

    //components
    //navigation_bar.dart
    fontSize = 20;
    space = 0;
    highLightSize = 120;
    imageWidth = 60;
    h = 60;

    //footer.dart
    footerFontSize = 12;

    //pages
    //aiia_intro.dart
    aiia1FontSize = 90;
    aiia2FontSize = 70;
    logoSize = 600;
    contentsFontSize = 22;
    contentsTextWidth = responsiveWidth - 670;

    //members.dart
    groupName = 50;
    profileSize = 65;
    nameSize = 25;
    card = 240;
    majorFont = 20;

    //contents.dart
    listWidth = 780;
    listSpace = 40;
    listTitle = 25;
    listExplanation = 15;
    subTitleFont = 50;

    //nakalicoubae.dart
    activityWidth = responsiveWidth * .6;

    //post_builder.dart
    titleSize = 50;
    postWidth = responsiveWidth * .1;
  } else if (responsiveWidth <= 2000 && responsiveWidth > 1400) {
//all
    title = 50;
    isWeb = true;

    //components
    //navigation_bar.dart
    fontSize = 20;
    space = 0;
    highLightSize = 120;
    imageWidth = 60;
    h = 60;

    //footer.dart
    footerFontSize = 12;

    //pages
    //aiia_intro.dart
    aiia1FontSize = 80;
    aiia2FontSize = 53;
    logoSize = 480;
    contentsFontSize = 19;
    contentsTextWidth = responsiveWidth - 550;

    //members.dart
    groupName = 50;
    profileSize = 65;
    nameSize = 25;
    card = 240;
    majorFont = 20;

    //contents.dart
    listWidth = 780;
    listSpace = 40;
    listTitle = 25;
    listExplanation = 15;
    subTitleFont = 50;

    //post_builder.dart
    titleSize = 50;
    postWidth = responsiveWidth * .1;
  } else if (responsiveWidth <= 1400 && responsiveWidth > 700) {
    //all
    title = 45;
    isWeb = true;

    //
    //components
    //navigation_bar.dart
    fontSize = 18;
    space = 0;
    highLightSize = 100;
    imageWidth = 50;
    h = 55;

    //footer.dart
    footerFontSize = 11;

    //
    //pages
    //aiia_intro.dart
    aiia1FontSize = 50;
    aiia2FontSize = 40;
    logoSize = 300;
    contentsFontSize = 15;
    contentsTextWidth = responsiveWidth - 350;

    //members.dart
    groupName = 50;
    profileSize = 60;
    nameSize = 20;
    card = 240;
    majorFont = 20;

    //contents.dart
    listWidth = 680;
    listSpace = 40;
    listTitle = 23;
    listExplanation = 13;
    subTitleFont = 45;

    //post_builder.dart
    titleSize = 50;
    postWidth = responsiveWidth * .1;
  } else {
    //mobile
    //all
    title = 30;
    isWeb = false;

    //navigation_bar.dart
    fontSize = 15;
    highLightSize = 80;
    imageWidth = 40;
    h = 50;

//
    //pages
    //aiia_intro.dart
    aiia1FontSize = 50;
    aiia2FontSize = 40;
    logoSize = 300;
    contentsFontSize = 15;
    contentsTextWidth = responsiveWidth - 10;

    //members.dart
    groupName = 30;
    profileSize = 55;
    nameSize = 15;
    card = 170;
    majorFont = 15;

    //contents.dart
    listWidth = responsiveWidth;
    listSpace = 0;
    listTitle = 20;
    listExplanation = 11;
    subTitleFont = 35;

    //post_builder.dart
    titleSize = 30;

    //footer.dart
    footerFontSize = 10;
  }
}

Widget nullWidget() {
  return const SizedBox(
    height: 0,
  );
}

Future popupForm(BuildContext context, String title, Widget widget) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          content: SizedBox(width: 700, height: 800, child: widget),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('닫기'),
            ),
          ],
        );
      });
}

Future commingSoon(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'AIIA',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          content: const Text('COMMING SOON!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('닫기'),
            ),
          ],
        );
      });
}
