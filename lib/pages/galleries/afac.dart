import 'package:aiia_webpage/pages/gallery.dart';
import 'package:flutter/material.dart';

Widget afac0222() {
  return Image.asset(
    'assets/logos/AFAC.png',
    fit: BoxFit.cover,
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
