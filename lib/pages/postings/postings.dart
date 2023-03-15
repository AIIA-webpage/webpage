// ignore_for_file: must_be_immutable

import 'package:aiia_webpage/components/globals.dart';
import 'package:aiia_webpage/pages/postings/post_builder.dart';
import 'package:flutter/material.dart';

class P0108 extends StatelessWidget {
  P0108(this.getPost);
  Function getPost;

  @override
  Widget build(BuildContext context) {
    return post(
        '[01/08] 교내 자율 동아리 AIIA가 공식적으로 출범하였습니다.',
        'AIIA는 가천대학교 글로벌 캠퍼스 교내 자율동아리로,\n2023년 1월 8일 AI·소프트웨어학부 인공지능 전공생 3명에 의해 창설된 '
            '교내 유일무이 IT 플랫폼 탐구·개발 동아리입니다.\n\n'
            'AIIA는 구글에서 개발한 하이브리드 웹 프레임워크 플랫폼인 Flutter를 주 언어로 채택하여 Android, iOS와 같은 모바일 '
            '환경에서부터 Window, macOS, 리눅스와 같은 웹 브라우저 환경까지 다양한 플랫폼에서 활용될 수 있는 '
            '앱/웹 서비스를 제작하는 \'Gachon Project\'를 동아리의 주요한 활동으로 두고 있습니다. '
            '이외에도 Major-Study Group, Future Tech Seminar, Na-kali-coubae on the block 등 '
            '다양한 컨텐츠를 운영하여 항상 동아리 개개인의 잠재력 향상을 위해 노력하고 있습니다.',
        'null',
        getPost,
        nullWidget());
  }
}

class P0209 extends StatelessWidget {
  P0209(this.getPost);
  Function getPost;

  @override
  Widget build(BuildContext context) {
    return post(
        '[02/09 ~ 02/12] 제 1회 NAKALICOUBAE ON THE BLOCK 재학생 참여자 모집.',
        '교내 자율 동아리 AIIA와 함께하는 제1회 NAKALACUBAE ON THE BLOCK에 AI·소프트웨어학부 재학생 여러분을 초대합니다.\n'
            'NAKALACUBAE ON THE BLOCK은 네카라쿠배 현직자 및 스타트업 대표 특별 초청 강연으로 이번 강연은 특히 본교 졸업생분을 모셔 학교생활과 관련된 것은 물론,'
            '진로나 취업에 대한 궁금증까지 해결할 수 있는 귀중한 시간이 될 것입니다. 본래 동아리 한정 행사로 기획되고 진행 예정이었으나\n'
            '소중한 시간을 우리 학부 재학생들과 공유하고 싶다는 생각에 이와 같은 자리를 마련하고 신청을 받게 되었습니다. '
            '구체적인 시간과 참여 조건, 장소 및 지원 방법은 포스터 형식의 이미지 게시물을 참고해주세요.\n\n학우분들의 많은 관심 부탁드립니다!\n\n\n',
        'assets/posts/nakalacoubae1.jpg',
        getPost,
        nullWidget());
  }
}

class P0214 extends StatelessWidget {
  P0214(this.getPost);
  Function getPost;

  @override
  Widget build(BuildContext context) {
    return post(
        '[02/14] AI·SW학부 신입생 환영회, AIIA도 다녀왔습니다.',
        '교내 자율 동아리 AIIA는 지난 14일 가천대학교 AI·소프트웨어학부 인공지능 전공과 소프트웨어 전공 신입생 환영회에 참석하여 동아리 홍보의 시간을 가졌습니다.\n'
            '학교에 입학한 신입생 학우분들에게 AIIA에 대해 알리는 한편, 새로운 동아리 구성원을 모집한다는 소식을 누구보다 먼저 소개해드릴 수 있었던 값진 시간이었습니다.\n '
            '자리를 마련해준 AI·소프트웨어학부 인공지능 전공 학생회와 소프트웨어 전공 학생회에 감사인사를 전합니다.\n\n\n',
        'assets/posts/0214_1.jpg',
        getPost,
        Column(
          children: [
            Image.asset(
              'assets/posts/0214_2.jpg',
            ),
            Image.asset(
              'assets/posts/0214_3.jpg',
            ),
            Image.asset(
              'assets/posts/0214_4.jpg',
            ),
          ],
        ));
  }
}

class P0216 extends StatelessWidget {
  P0216(this.getPost);
  Function getPost;

  @override
  Widget build(BuildContext context) {
    return post(
        '[02/16 ~ 02/23] AIIA 1기 2302 모집.',
        '안녕하세요, 교내 자율 동아리이자, 교내 유일무이 IT 탐구 개발 동아리 AIIA입니다.❗/n'
            '차세대 프레임워크로 매일매일 성장해나가는 AIIA는 선후배 네트워크를 활용한 효율적인 전공 과목 스터디, 교내 애플리케이션과 웹 서비스를 직접 제작하는 가천 프로젝트, \n'
            'IT 공룡기업 및 스타트업 현직자를 초청하는 네카라쿠배 온 더 블록까지 인공지능 전공생의 다양한 실습 활동 경험을 위해 조직된 동아리입니다.\n'
            '본 동아리를 통해 우수한 인재들과 인적 네트워크를 조성하고, 활동의 결실을 통해 가천대학교 AI•소프트웨어학부 인공지능 전공의 미래를 밝혀나가고자 합니다.\n'
            ' 구체적인 활동 내용 및 혜택 사항, 모집 관련 정보는 첨부된 포스터 형식의 홍보 게시물을 참고해주세요.\n\n'
            '학우분들의 많은 관심 부탁드립니다!\n\n',
        'assets/posts/2302_recruitment.jpg',
        getPost,
        nullWidget());
  }
}
