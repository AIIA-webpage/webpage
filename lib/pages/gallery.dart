import 'package:aiia_webpage/components/globals.dart';
import 'package:aiia_webpage/pages/galleries/afac.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'galleries/nakalicoubae.dart';

Widget post(BuildContext context, String title, String tempText, Widget widget,
    bool padding) {
  return Container(
      padding:
          isWeb && padding ? const EdgeInsets.all(20) : const EdgeInsets.all(2),
      child: ElevatedButton(
          onPressed: () {
            popupForm(context, title, widget);
          },
          style: ElevatedButton.styleFrom(elevation: 2.0),
          child: Text(tempText)));
}

Widget noPost(BuildContext context, String title, String tempText,
    Widget widget, bool padding) {
  return Container(
      padding:
          isWeb && padding ? const EdgeInsets.all(20) : const EdgeInsets.all(2),
      child: ElevatedButton(
          onPressed: () {
            commingSoon(context);
          },
          style: ElevatedButton.styleFrom(elevation: 2.0),
          child: Image.asset(
            'assets/logos/logo1.png',
            fit: BoxFit.fill,
          )));
}

// ignore: must_be_immutable
class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> p = [
      noPost(context, 'OT', ' ', nullWidget(), true),
      post(context, 'NAKALICOUBAE 1', 'NAKALICOUBAE 1', nklcb0222(), true),
      post(context, 'AFAC 2301', 'AFAC 2301', afac0222(), true),
    ];
    return SizedBox(
      width: isWeb ? pageWidth * .8 : pageWidth,
      child: AnimationLimiter(
        child: GridView.count(crossAxisCount: 3, children: [
          //context, title, image, postWidget, padding
          noPost(context, ' ', ' ', nullWidget(), true),
          noPost(context, ' ', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          post(context, 'NAKALICOUBAE 1', 'NAKALICOUBAE 1', nklcb0222(), true),
          post(context, 'AFAC 2301', 'AFAC 2301', afac0222(), true),
        ]),
      ),
    );
  }

  /* SizedBox(
      width: isWeb ? pageWidth * .8 : pageWidth,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          //context, title, image, postWidget, padding
          noPost(context, ' ', ' ', nullWidget(), true),
          noPost(context, ' ', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          noPost(context, 'OT', ' ', nullWidget(), true),
          post(context, 'NAKALICOUBAE 1', 'NAKALICOUBAE 1', nklcb0222(), true),
          post(context, 'AFAC 2301', 'AFAC 2301', afac0222(), true),
        ],
      ),
    );

   */
}
