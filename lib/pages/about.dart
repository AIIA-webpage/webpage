import 'package:aiia_webpage/components/widgets/box.dart';
import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';

final posts = ['News', 'p0108', 'p0209', 'p0214', 'p0216'];

// ignore: must_be_immutable
class About extends StatelessWidget {
  About();

//1st. 일정 관련 블록
  Widget schedule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            box('2023(JAN~MAR) SCHEDULE', ' '),
            Image.asset(
              'assets/components/schedule.png',
            ),
          ],
        ),
      ],
    );
  }

  //2nd. 수습부원 설명 블록
  Widget crewOnProbation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box(
            '수습부원 제도',
            'AIIA는 활동 중 다량의 팀프로젝트를 기획 및 제작합니다.\n'
                '우리 동아리에서는 모든 지원자가 면접을 거친 후 수습부원 기간 동안 맡은 과제를 충실히 이행하였을 때 정규부원으로 승급 할 수 있고, 승급 되지 못한 인원은 더 이상 동아리에 참여할 수 없습니다.\n'
                '따라서, 검증된 인원만 팀프로젝트에 참여할 수 있습니다.'),
        const Text('   CREW ON PROBATION -> OFFICIAL CREW',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  //3rd. 로고 설명 관련 블록
  Widget logos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box('LOGOS', ''),
        Wrap(
          children: [
            Image.asset(
              'assets/logos/mascort.jpg',
              width: 300,
            ),
            Image.asset(
              'assets/logos/mascort2.jpeg',
              width: 300,
            ),
            Image.asset(
              'assets/logos/circle_logo1.png',
              width: 300,
            ),
            Image.asset(
              'assets/logos/circle_logo2.png',
              width: 300,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          '  About',
          style: TextStyle(
            fontSize: title,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),
        Column(
          children: [
            schedule(),
            crewOnProbation(),
            logos(),
          ],
        ),
        const Footer()
      ],
    );
  }
}
