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

class _MembersState extends State<Members> {
  Widget profile(String engName, String name, String summary, String fileName) {
    String filePath = '';
    fileName != 'null'
        ? filePath = 'assets/profiles/$fileName'
        : filePath = 'assets/profiles/sample.png';
    return Container(
      color: Colors.grey[300],
      width: card + 30,
      child: Column(
        children: [
          Container(
            width: card,
            height: 375,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(blurRadius: 10, color: Colors.grey, spreadRadius: 2)
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                //상단 그라데이션 박스
                Container(
                  width: card,
                  height: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF63E4E5),
                        Color(0xFF8B7CE0),
                      ],
                    ),
                  ),
                ),
                //하단 하얀색 정보 박스
                Positioned(
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
                ),
                //프로필 원형 이미지
                Positioned(
                  top: 50,
                  left: 53,
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black,
                              spreadRadius: 2)
                        ]),
                    child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(filePath),
                        radius: 70),
                  ),
                ),
                //우상단 로고
                Positioned(
                    child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/logos/logo.png',
                      width: 40,
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileWidget(
      String engName, String korName, String summary, String fileName) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Material(child: profile(engName, korName, summary, fileName)),
      back: Material(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadiusDirectional.circular(30.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            'assets/nameTags/$engName.jpg',
            width: card,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                'CAPTIN',
                style: TextStyle(
                  fontSize: groupName,
                  fontWeight: FontWeight.w800,
                  height: 1,
                ),
              ),
            ],
          ),
          //profile : 이름, 자기소개, 파일 이름
          Row(
            children: [
              profileWidget('KimHanBaek', '김한백', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                  'KimHanBaek.png'),
              const SizedBox(
                width: 40,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '- AIIA_CAPTIN',
                    style: TextStyle(fontSize: 20, height: 2),
                  ),
                  Text(
                    '- AIIA_CAPTIN',
                    style: TextStyle(fontSize: 20, height: 2),
                  ),
                  Text(
                    '- AIIA_CAPTIN',
                    style: TextStyle(fontSize: 20, height: 2),
                  ),
                  Text('\n\n\n\n\n\n')
                ],
              )
            ],
          ),

          titleSet('CO-PILOT'),
          Wrap(children: [
            profileWidget("KooDoYeon", "구도연", 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'KooDoYeon.jpg'),
            profileWidget("ParkJuHyuk", "박주혁", 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'ParkJuHyuk.png'),
          ]),

          titleSet('FLIGHT ATTENDENT'),
          Wrap(children: [
            profileWidget('MinSaeWon', '민세원', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'MinSaeWon.jpg'),
            profileWidget('HwangJungMin', '황정민', 'AI·소프트웨어학부\n인공지능 전공 23학번',
                'HwangJungMin.jpg'),
          ]),

          titleSet('OFFICIAL CREW'),
          Wrap(
            runAlignment: WrapAlignment.start,
            children: <Widget>[
              profileWidget('KimJiMin', '김지민', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                  'KimJiMin.jpg'),
              profileWidget('BaekChaeYoon', '백채윤', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                  'BaekChaeYoon.jpg'),
              profileWidget('ChoiMinSeok', '최민석', 'AI·소프트웨어학부\n인공지능 전공 22학번',
                  'ChoiMinSeok.png'),
            ],
          ),
          titleSet('CREW ON PROBATION\n\n'),
          const Footer()
        ],
      ),
    );
  }
}
