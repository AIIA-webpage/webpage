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
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: card,
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(filePath),
            radius: profileSize),
        const SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 25,
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
          height: 30,
        )
      ]),
    );
  }

  Widget profileWidget(
      String engName, String korName, String summary, String fileName) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Material(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadiusDirectional.circular(30.0),
        child: SizedBox(
          width: card + 5,
          child: Row(
            children: [
              profile(engName, korName, summary, fileName),
            ],
          ),
        ),
      ),
      back: Material(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadiusDirectional.circular(30.0),
        child: Image.asset(
          'assets/nameTags/$engName.jpg',
          width: card,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '\nCAPTIN',
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
          profileWidget(
              "KooDoYeon", "구도연", 'AI·소프트웨어학부\n인공지능 전공 21학번', 'KooDoYeon.jpg'),
          profileWidget("ParkJuHyuk", "박주혁", 'AI·소프트웨어학부\n인공지능 전공 21학번',
              'ParkJuHyuk.png'),
        ]),

        titleSet('FLIGHT ATTENDENT'),
        Wrap(children: [
          profileWidget(
              'MinSaeWon', '민세원', 'AI·소프트웨어학부\n인공지능 전공 21학번', 'MinSaeWon.jpg'),
          profileWidget('HwangJungMin', '황정민', 'AI·소프트웨어학부\n인공지능 전공 23학번',
              'HwangJungMin.jpg'),
        ]),

        titleSet('OFFICIAL CREW'),
        Wrap(
          runAlignment: WrapAlignment.start,
          children: <Widget>[
            profileWidget(
                'KimJiMin', '김지민', 'AI·소프트웨어학부\n인공지능 전공 21학번', 'KimJiMin.jpg'),
            profileWidget('BaekChaeYoon', '백채윤', 'AI·소프트웨어학부\n인공지능 전공 21학번',
                'BaekChaeYoon.jpg'),
            profileWidget('LeeDongWon', '이동원', 'AI·소프트웨어학부\n소프트웨어 전공 23학번',
                'LeeDongWon.png'),
            profileWidget('ChoiMinSeok', '최민석', 'AI·소프트웨어학부\n인공지능 전공 22학번',
                'ChoiMinSeok.png'),
          ],
        ),
        titleSet('CREW ON PROBATION\n\n'),

        const Footer()
      ],
    );
  }
}
