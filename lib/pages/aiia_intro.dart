import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'galleries/afac.dart';
import 'galleries/nakalicoubae.dart';
import 'package:card_swiper/card_swiper.dart';

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

final List<String> imgList = [
  "https://via.placeholder.com/350x150",
  "https://via.placeholder.com/350x150",
  "https://via.placeholder.com/350x150",
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
          aspectRatio: 16 / 9,
          animateToClosest: true,
          padEnds: false),
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
                onTap: () {
                  if (i == 3) {
                    popupForm(context, activityList[i], nklcbMenu(context));
                  } else if (i == 4) {
                    popupForm(context, activityList[i], afacMenu(context));
                  } else {
                    commingSoon(context);
                  }
                },
                child: Container(
                    width: 300,
                    height: 200,
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        Text(
                          activityList[i],
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(textList[i],
                            style: const TextStyle(
                              fontSize: 20,
                            ))
                      ],
                    )),
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

  Widget mainBackGround() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        color: Color(0xFF161C2A),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              'assets/logos/background.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              height: 1000,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF161C2A), Color(0xFF5DA8D4), Colors.white],
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            height: 500,
          ),
          Container(
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xFF5DA8D4),
                ],
              ),
            ),
          ),
        ]),
      )
    ]);
  }

  Widget contents() {
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
                    const SizedBox(
                      height: 180,
                    ),
                    Container(
                      width: double.infinity,
                      height: 400,
                      child: Swiper(
                        autoplay: true,
                        scale: 0.7,
                        viewportFraction: 0.33,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 500,
                            height: 300,
                            color: Colors.grey,
                            child: Text('test'),
                          );
                        },
                        itemCount: 3,
                        pagination: SwiperPagination(),
                        control: SwiperControl(),
                      ),
                    ),
                  ],
                )),
            miniLogo(680),
          ],
        ),
      ],
    );
  }

  Widget coloredText(String t, double f, int c) {
    //text, fontSize, color
    return Text(
      t,
      style: TextStyle(
        fontSize: f,
        fontWeight: FontWeight.bold,
        color: Color(c),
      ),
    );
  }

  Widget _intro(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    mainBackGround(),
                    Align(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 1000,
                          ),
                          Column(children: [
                            const Text(
                              'Scroll Down',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Open Sans',
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(height: 1000),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    coloredText('A', 60, 0xFF8B7CE0),
                                    coloredText('rtificial', 60, 0xFF000000),
                                    coloredText('  I', 60, 0xFF8292E3),
                                    coloredText('ntelligence', 60, 0xFF000000),
                                    coloredText('  I', 60, 0xFF70BEE3),
                                    coloredText('n', 60, 0xFF000000),
                                    coloredText('  A', 60, 0xFF63E4E5),
                                    coloredText('ctions', 60, 0xFF000000),
                                  ],
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                Wrap(
                                  children: const [
                                    Text(
                                      'IT 플랫폼 탐구·개발 자율동아리 AIIA는  ‘Artificial Intelligence In Actions’의 약자로, 플랫폼에 탑재할 인공지능 모델 개발 의지를 담고 있습니다.\n'
                                      '주 언어로는 Google의 하이브리드 웹 프레임워크인 Flutter를 채택하여 모바일부터 웹 환경까지 다양한 생태계에서 사용할 수 있는 서비스를 개발하는\n'
                                      'Gachon Project’를 동아리의 대표적인 활동으로 운영하고 있습니다.\n'
                                      ' 이외에도 다양한 콘텐츠를 통해 개인의 잠재력 향상과 AI·소프트웨어 학부 전체에 도움이 되도록 노력하고 있습니다.',
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ])
                        ],
                      ),
                    ),
                  ],
                ),
                contents(),
                apply()
              ],
            ),
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

  // Apply Widget
  Widget apply() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(100.0),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 800,
                height: 620,
                // color: const Color(0xFF161C2A),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/logos/apply.png'),
                    ),
                    color: const Color(0xFF161C2A),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'A',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF8B7CE0),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: 'I',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF8292E3),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: 'I',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF70BEE3),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: 'A',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF63E4E5),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: '에 지원하세요!',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontFamily: 'Apple SD',
                              fontWeight: FontWeight.w100)),
                    ])),
                    const Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'A',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF8B7CE0),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: 'I',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF8292E3),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: 'I',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF70BEE3),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: 'A',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF63E4E5),
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w800)),
                      TextSpan(
                          text: '는 함께 일할 열정 넘치는 인재들을 모집하고 있습니다.',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Apple SD',
                              fontWeight: FontWeight.w100)),
                    ])),
                    const Text('부담없이 문의 주세요.',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Apple SD',
                            fontWeight: FontWeight.w100)),
                    const SizedBox(
                      height: 40,
                    ),
                    DecoratedBox(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color(0xFF8B7CE0),
                              Color(0xFF63E4E5)
                              //add more colors
                            ]),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.57), //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                              //make color or elevated button transparent
                            ),
                            onPressed: () {
                              _launchURL();
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text("지원 & 문의하기",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'Apple SD',
                                      fontWeight: FontWeight.w100)),
                            ))),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //info link
  void _launchURL() async {
    const url = 'https://link.inpock.co.kr/aiia';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
