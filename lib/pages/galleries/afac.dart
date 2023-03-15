import 'package:aiia_webpage/pages/gallery.dart';
import 'package:flutter/material.dart';

Widget afac0222() {
  return ListView(
    children: [
      for (int i = 1; i <= 10; i++)
        Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/activities/AFAC/0222/$i.jpg',
            )),
    ],
  );
}

Widget afacMenu(BuildContext context) {
  return SizedBox(
      width: 500,
      height: 300,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          post(context, 'AFAC 2301', 'AFAC 2301', afac0222(), false),
        ],
      ));
}
