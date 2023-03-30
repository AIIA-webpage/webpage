import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'galleries/afac.dart';
import 'galleries/nakalicoubae.dart';

late AnimationController _bannerController;
late Animation<double> _bannerAnimation;
late AnimationController _movingController;
Tween<Offset> controllerTween =
    Tween<Offset>(begin: const Offset(0.05, 0), end: Offset.zero);

bool isHovering = false;

final List<String> activityList = [
'GACHON PROJECT',
'MAJOR-STUDY GROUP',
'FUTURE TECH SEMINAR',
'NAKALICOUBAE ON THE BLOCK',
'AFAC',
'MEMBERCHIP TRAINING',
'IT SHOW, AI EXPO'
];

final List<String> textList = [
'인공지능전공 학생들의 전공과목 스터디 시행 / 각종 프로젝트를 통하여 개인 포트폴리오 구성',
'각 학년별로 모여 전공 과목 복습 및 공부할 수 있는 자리 마련 또는 선배님께 전공/학교생활 관련 조언을 얻을 수 있는 기회.',
'모든 동아리원들이 참여하는 기술 동향 조사 프레젠테이션. 산업, 특히 인공지능 관련 트렌드를 읽고 분석하는 능력 향상.',
'네카라쿠배에 근무중인 우리 학교 선배님을 모셔서 다양한 이야기를 듣고, Q&A 등을 진행합니다.',
'설명회',
'1년에 2번 정도 동아리원들이 참여하는 MT가 예정되어 있습니다.',
'IT, AI 관련 박람회가 있을 때 동아리 단위로 행사에 참여하여 관련 기술 동향을 익히고 관심을 가지는 시간을 갖습니다.',
];

Widget imageBanner() {
  return Container(
    width: 600,
    margin: const EdgeInsets.all(15),
    child: CarouselSlider.builder(
      itemCount: activityList.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 350,
        autoPlay: true,
        viewportFraction: 1.0,
        disableCenter: true,
        autoPlayInterval: const Duration(seconds: 3),
        reverse: false,
        aspectRatio: 16/9,
        animateToClosest: true,
        padEnds: false
      ),
      itemBuilder: (context, i, id) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: InkWell(
                onTap: (){
                  if(i == 3){
                    popupForm(context, activityList[i], nklcbMenu(context));
                  }
                  else if(i == 4){
                    popupForm(context, activityList[i], afacMenu(context));
                  }
                  else{
                    commingSoon(context);
                  }
                },
                child: Container(
                  width: 300,
                  height: 200,
                  color: Colors.grey[300],
                  child: Column(children: [
                    Text(activityList[i], style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text(textList[i], style: const TextStyle(fontSize: 20,))
                  ],)
                ),
              ),
            ),
          ),
          onTap: () {
            var url = activityList[i];
          },
        );
      },
    ),
  );
}

class AiiaIntro extends StatefulWidget {
  const AiiaIntro();

  @override
  State<AiiaIntro> createState() => _AiiaIntroState();
}

class _AiiaIntroState extends State<AiiaIntro> with TickerProviderStateMixin {
  initState() {
    super.initState();

    _bannerController = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _bannerAnimation =
        CurvedAnimation(parent: _bannerController, curve: Curves.fastOutSlowIn);

    _movingController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _movingController.forward();
    _bannerController.forward();
  }

  @override
  dispose() {
    _bannerController.dispose();
    _movingController.dispose();
    super.dispose();
  }

  Widget gradientBackground() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.white,
        ),
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xFF9AD1EB),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget miniLogo(double h) {
    return Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              height: h,
            ),
            Image.asset(
              'assets/logos/logo.png',
              width: 30,
            ),
          ],
        ));
  }

  Widget archive() {
    return Column(
      children: [
        Container(
          width: pageWidth,
          height: 100,
          color: const Color(0xFF161C2A),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'AIIA Contents',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            gradientBackground(),
            miniLogo(70),
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 200),
                    imageBanner(),
                  ],
                )),
            miniLogo(680),
          ],
        ),
      ],
    );
  }

  Widget _intro(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            archive(),
          ],
        ),
        const Footer()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _intro(context)),
        ],
      ),
    );
  }
}
