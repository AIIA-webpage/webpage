import 'package:aiia_webpage/components/widgets/box.dart';
import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

late AnimationController _bannerController;
late Animation<double> _bannerAnimation;
late AnimationController _movingController;
Tween<Offset> controllerTween =
    Tween<Offset>(begin: const Offset(0.05, 0), end: Offset.zero);

bool isHovering = false;
final List<String> imageList = [
  'assets/boards/recruitment.png',
  'assets/boards/AFAC.jpg',
  'assets/boards/NKCB.jpg',
];

Widget titleStyle(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: aiia2FontSize,
      fontWeight: FontWeight.w800,
      height: 1.2,
      color: color,
    ),
  );
}

Widget logo() {
  return FadeTransition(
    opacity: _bannerAnimation,
    child: Image.asset(
      'assets/logos/logo1.png',
      width: logoSize,
    ),
  );
}

Widget aiiaTitle() {
  return FadeTransition(
      opacity: _bannerAnimation,
      child: isWeb
          ? Text(
              'AIIA',
              style: TextStyle(
                fontSize: aiia1FontSize,
                fontWeight: FontWeight.w800,
                height: 1.2,
                color: Colors.white,
              ),
            )
          : nullWidget());
}

Widget artificialIntelligenceInActions() {
  return SlideTransition(
    position: _movingController.drive(controllerTween),
    child: FadeTransition(
      opacity: _bannerAnimation,
      child: Wrap(children: [
        titleStyle('A', const Color(0xFF8B7CE0)),
        titleStyle('rtificial', Colors.white),
        titleStyle(' I', const Color(0xFF8292E3)),
        titleStyle('ntelligence', Colors.white),
        titleStyle(' I', const Color(0xFF70BEE3)),
        titleStyle('n', Colors.white),
        titleStyle(' A', const Color(0xFF63E4E5)),
        titleStyle('ctions.', Colors.white),
      ]),
    ),
  );
}

Widget aiiaIntroduce() {
  return FadeTransition(
    opacity: _bannerAnimation,
    child: Container(
      margin: const EdgeInsets.all(10),
      width: contentsTextWidth,
      child: Wrap(
        children: [
          SelectableText(
            '\nAIIA는 교내 자율 동아리이자 교내 유일 IT 플랫폼 탐구·개발 동아리로, '
            'AI·소프트웨어 학부 인공지능 전공 재학생 3명에 의해 2023년 1월 8일에 창설되었습니다. \n'
            'Artificial Intelligence In Actions의 약자인 AIIA라는 동아리의 이름은 '
            '프로젝트 성과를 위한 인공지능 모델 개발의 의지를 담고 있습니다.\n'
            'AIIA는 Google에서 개발한 하이브리드 웹 프레임워크인 Flutter를 주 언어로 채택하여 '
            'Android, iOS 등의 모바일 환경부터 Window와 macOS, Linux 등의 웹 브라우저 환경까지 '
            '다양한 생태계에서 사용할 수 있는 애플리케이션 및 웹 서비스를 개발하는 ‘Gachon Project’를 동아리의 대표 활동으로 두고 있습니다.\n'
            '이외에도 다양한 콘텐츠를 운영하여 '
            '개인의 잠재력 향상과 AI·소프트웨어 학부 전체에 도움이 될 수 있도록 노력하고 있습니다.',
            style: TextStyle(
                fontSize: contentsFontSize, height: 1.9, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

Widget imageBanner() {
  return Container(
    width: 600,
    margin: const EdgeInsets.all(15),
    child: CarouselSlider.builder(
      itemCount: imageList.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 350,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        reverse: false,
        aspectRatio: 5.0,
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
              child: Image.asset(
                imageList[i],
                width: 550,
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () {
            var url = imageList[i];
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

  Widget linkButton() {
    return InkWell(
      onHover: (hovering) {
        setState(() => isHovering = hovering);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        width: isHovering ? 360 : 300,
        child: Image.asset(
          'assets/components/button.png',
        ),
      ),
      onTap: () async {
        var url = Uri.parse(
            'https://link.inpock.co.kr/aiia?fbclid=PAAabUiversSc4ShOQKW55sHRyz2jvDbTaB8_oKsLmSsooxrgb_fn9MYwM72Q');
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }

  //1st. 남색 배경에 돌고래 로고와 AIIA, 설명이 있는 블록
  Widget aiia() {
    return Container(
        color: const Color(0xff161c2a),
        child: isWeb
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  logo(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      aiiaTitle(),
                      artificialIntelligenceInActions(),
                      aiiaIntroduce(),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  logo(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      aiiaTitle(),
                      artificialIntelligenceInActions(),
                      aiiaIntroduce(),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  )
                ],
              ));
  }

//2nd. 지원 관련 블록
  Widget recruitment() {
    return Column(
      children: [
        isWeb
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      box('AIIA에 지원하세요!', ' 2302 Recruitment (2/16 ~ 2/23)\n'),
                      linkButton()
                    ],
                  ),
                  imageBanner()
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      box('AIIA에 지원하세요!', ' 2302 Recruitment (2/16 ~ 2/23)\n'),
                      linkButton()
                    ],
                  ),
                  imageBanner()
                ],
              )
      ],
    );
  }

  Widget _intro(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aiia(),
            recruitment(),
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
