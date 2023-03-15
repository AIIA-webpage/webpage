import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';

final posts = ['News', 'p0108', 'p0209', 'p0214', 'p0216'];

// ignore: must_be_immutable
class News extends StatelessWidget {
  News(this.getPost);
  Function getPost;

  Widget posting(String title, String fileName, int idx) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        InkWell(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Wrap(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          height: 1,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () {
            for (int i = 0; i < 5; i++) {
              if (fileName == posts[i]) {
                getPost(i);
              }
            }
          },
        ),
        const Divider(
          height: 1.0,
          color: Colors.black,
          thickness: 0.5,
        ),
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
          '  AIIA NEWS',
          style: TextStyle(
            fontSize: title,
            fontWeight: FontWeight.w800,
            height: 1,
          ),
        ),
        posting('[02/16 ~ 02/23] AIIA 1기 2302 모집.', 'p0216', 4),
        posting('[02/14] AI·SW학부 신입생 환영회, AIIA도 다녀왔습니다.', 'p0214', 3),
        posting('[02/09 ~ 02/12] 제 1회 NAKALICOUBAE ON THE BLOCK 재학생 참여자 모집.',
            'p0209', 2),
        posting('[01/08] 교내 자율 동아리 AIIA가 공식적으로 출범하였습니다.', 'p0108', 1),
        const SizedBox(
          height: 300,
        ),
        const Footer()
      ],
    );
  }
}
