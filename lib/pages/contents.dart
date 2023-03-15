import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:aiia_webpage/pages/galleries/afac.dart';
import 'package:aiia_webpage/pages/galleries/nakalicoubae.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class Contents extends StatelessWidget {
  Contents(this.context, {super.key});

  Widget content(String title, String description, int idx, Widget widget) {
    //Future popUp = popupForm(context, title, widget);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            idx == 3 || idx == 4
                ? popupForm(context, title, widget)
                : commingSoon(context);
          },
          child: Container(
            width: listWidth,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: listTitle,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      FontAwesomeIcons.externalLinkAlt,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: listExplanation,
                      height: 1.7,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        idx != 6
            ? const Divider(
                height: 1,
                endIndent: 0,
                color: Colors.grey,
                thickness: 1,
              )
            : nullWidget()
      ],
    );
  }

  BuildContext context;
  Widget _members(BuildContext context) {
    var responsiveHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
        height: responsiveHeight - 61,
        child: ListView(
          padding: const EdgeInsets.only(top: 10),
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '  CONTENTS',
                style: TextStyle(
                  fontSize: title,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: listSpace,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black)),
                    width: listWidth,
                    child: Column(
                      children: [
                        content(
                            '1. GACHON PROJECT',
                            '인공지능전공 학생들의 전공과목 스터디 시행 / 각종 프로젝트를 통하여 개인 포트폴리오 구성',
                            0,
                            const Text('Comming Soon!')),
                        content(
                            '2. MAJOR-STUDY GROUP',
                            '각 학년별로 모여 전공 과목 복습 및 공부할 수 있는 자리 마련 또는 선배님께 전공/학교생활 관련 조언을 얻을 수 있는 기회.',
                            1,
                            const Text('Comming Soon!')),
                        content(
                            '3. FUTURE TECH SEMINAR',
                            '모든 동아리원들이 참여하는 기술 동향 조사 프레젠테이션. 산업, 특히 인공지능 관련 트렌드를 읽고 분석하는 능력 향상.',
                            2,
                            const Text('Comming Soon!')),
                        content(
                            '4. NAKALACOUBAE ON THE BLOCK',
                            '네카라쿠배에 근무중인 우리 학교 선배님을 모셔서 다양한 이야기를 듣고, Q&A 등을 진행합니다.',
                            3,
                            nklcbMenu(context)),
                        content('5. AFAC', '발표회', 4, afacMenu(context)),
                        content(
                            '6. MEMBERCHIP TRAINING',
                            '1년에 2번 정도 동아리원들이 참여하는 MT가 예정되어 있습니다.',
                            5,
                            const Text('Comming Soon!')),
                        content(
                            '7. IT SHOW, AI EXPO',
                            'IT, AI 관련 박람회가 있을 때 동아리 단위로 행사에 참여하여 관련 기술 동향을 익히고 관심을 가지는 시간을 갖습니다.',
                            6,
                            const Text('Comming Soon!')),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
            const Footer()
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _members(context)),
        ]);
  }
}
