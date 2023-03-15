import 'package:aiia_webpage/components/globals.dart';
import 'package:aiia_webpage/components/widgets/title.dart';
import 'package:flutter/material.dart';

Widget image(String file) {
  var filePath = 'assets/activities/nakalicoubae/$file';
  return Container(
    padding: const EdgeInsets.all(20),
    child: Image.asset(filePath),
  );
}

Widget nakalicoubae() {
  return SizedBox(
    width: activityWidth,
    child: Column(children: [
      subTitle('네카라쿠배 온 더 블록 제 1회'),
      image('001.jpg'),
      image('002.jpg'),
      image('003.jpg'),
      image('004.jpg'),
      image('005.jpg'),
      image('006.jpg'),
    ]),
  );
}
