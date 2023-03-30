import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:aiia_webpage/components/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

double setImageWidth = 5;
var opacityValue = 0.0;

// ignore: must_be_immutable
class Members extends StatefulWidget {
  Members(this.isWeb, {super.key});
  bool isWeb;

  @override
  State<Members> createState() => _MembersState();
}

Widget cardGradient() {
  return Container(
    width: card,
    height: 120,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF63E4E5),
          Color(0xFF8B7CE0),
        ],
      ),
    ),
  );
}

Widget cardInfo(String name, String summary) {
  return Positioned(
    top: 120,
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      width: card,
      child: Column(children: [
        const SizedBox(
          height: 90,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1.5,
              color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          summary,
          style: TextStyle(fontSize: majorFont),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        )
      ]),
    ),
  );
}

Widget cardProfile(String filePath) {
  return Positioned(
    top: 50,
    left: 53,
    child: Container(
      decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 2)
      ]),
      child: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(filePath),
          radius: 70),
    ),
  );
}

Widget cardLogo() {
  return Positioned(
      child: Align(
    alignment: Alignment.topRight,
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.asset(
        'assets/logos/logo.png',
        width: 40,
      ),
    ),
  ));
}

Widget cardNameTag(String engName) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 2)
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/nameTags/$engName.jpg',
        width: card,
      ),
    ),
  );
}

class _MembersState extends State<Members> {
  Widget profile(String engName, String name, String summary, String fileName) {
    String filePath = '';
    fileName != 'null'
        ? filePath = 'assets/profiles/$fileName'
        : filePath = 'assets/profiles/sample.png';
    return Container(
      width: card,
      height: 373,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(blurRadius: 10, color: Colors.grey, spreadRadius: 2),
        ],
      ),
      child: Stack(
        children: [
          //상단 그라데이션 박스
          cardGradient(),
          //하단 하얀색 정보 박스
          cardInfo(name, summary),
          //프로필 원형 이미지
          cardProfile(filePath),
          //우상단 로고
          cardLogo()
        ],
      ),
    );
  }

  Widget profileWidget(
      String engName, String korName, String summary, String fileName) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Material(
        borderRadius: BorderRadius.circular(20),
        child: profile(engName, korName, summary, fileName),
      ),
      back: Material(
          borderRadius: BorderRadius.circular(20), child: cardNameTag(engName)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'CAPTIN / CO-PILOT',
              style: TextStyle(
                fontSize: groupName,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
          ),
          //profile : 이름, 자기소개, 파일 이름
          Wrap(runSpacing: 20, children: [
            const SizedBox(
              width: 20,
            ),
            profileWidget('KimHanBaek', '김한백', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'KimHanBaek.png'),
            const SizedBox(
              width: 50,
            ),
            profileWidget("KooDoYeon", "구도연", 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'KooDoYeon.jpg'),
            const SizedBox(
              width: 20,
            ),
            profileWidget("ParkJuHyuk", "박주혁", 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'ParkJuHyuk.png'),
          ]),
          titleSet('FLIGHT ATTENDENT / OFFICIAL CREW'),
          Wrap(runSpacing: 20, children: [
            const SizedBox(
              width: 20,
            ),
            profileWidget('MinSaeWon', '민세원', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'MinSaeWon.jpg'),
            const SizedBox(
              width: 20,
            ),
            profileWidget('HwangJungMin', '황정민', 'AI·소프트웨어학부\n인공지능 전공 23학번',
                'HwangJungMin.jpg'),
            const SizedBox(
              width: 50,
            ),
            profileWidget(
                'KimJiMin', '김지민', 'AI·소프트웨어학부\n인공지능 전공 21학번', 'KimJiMin.jpg'),
            const SizedBox(
              width: 20,
            ),
            profileWidget('BaekChaeYoon', '백채윤', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'BaekChaeYoon.jpg'),
            const SizedBox(
              width: 20,
            ),
            profileWidget('ChoiMinSeok', '최민석', 'AI·소프트웨어학부\n인공지능 전공 22학번',
                'ChoiMinSeok.png'),
          ]),
          titleSet('CREW ON PROBATION'),
          Wrap(
              runSpacing: 20,
              children: [
            const SizedBox(
            width: 20),
            profile('ChooHoSeong', '추호성', 'AI·소프트웨어학부\n인공지능 전공 23학번',
            'ChooHoSeong.jpeg'),
            const SizedBox(
            width: 20),
            profile('GukHuiGuen', '국희근', 'AI·소프트웨어학부\n인공지능 전공 23학번',
            'GukHuiGeun.jpeg'),
            const SizedBox(
            width: 20),
            profile('JinJunWoo', '진준우', 'AI·소프트웨어학부\n소프트웨어 전공 20 학번',
                'JinJunWoo.jpeg'),
            const SizedBox(
                width: 20),
            profile('JoYuJin', '조유진', 'AI·소프트웨어학부\n소프트웨어 전공 22학번',
                'JoYuJin.jpeg'),
            const SizedBox(
                width: 20), profile('KimLeeHyeon', '김이현', 'AI·소프트웨어학부\n소프트웨어 전공 23학번',
                'KimLeeHyeon.jpeg'),
            const SizedBox(
                width: 20), profile('KooBonWook', '구본욱', 'AI·소프트웨어학부\n소프트웨어 전공 20 학번',
                'KooBonWook.jpeg'),
            const SizedBox(
                width: 20), profile('NamSeungWoo', '남승우', 'AI·소프트웨어학부\n인공지능 전공 23 학번',
                'NamSeungWoo.jpeg'),
            const SizedBox(
                width: 20), profile('LeeHyoJin', '이효진', 'AI·소프트웨어학부\n컴퓨터공학 전공 20 학번',
                'LeeHyoJin.jpeg'),
            const SizedBox(
                width: 20), profile('MoonHeeSang', '문희상', 'AI·소프트웨어학부\n소프트웨어 전공 19 학번',
                'MoonHeeSang.jpeg'),
            const SizedBox(
                width: 20), profile('KwonMinJi', '권민지', 'AI·소프트웨어학부\n소프트웨어 전공 21 학번',
                'KwonMinJi.jpg'),
            const Footer(
            ),
      ]),
        ],
      ),
    );
  }
}