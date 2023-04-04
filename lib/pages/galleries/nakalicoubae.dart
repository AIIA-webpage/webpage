import 'package:flutter/material.dart';

import '../../components/globals.dart';
import '../gallery.dart';

Widget nklcb0222() {
  return ListView(
    children: [
      for (int i = 1; i <= 6; i++)
        Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/logos/NaKa.png',
              fit: BoxFit.cover,
            )),
    ],
  );
}

Widget nklcbMenu(BuildContext context) {
  return SizedBox(
      width: 500,
      height: 500,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          post(context, ' ', ' ', nullWidget(), false),
          post(context, 'NAKALICOUBAE 1', 'NAKALICOUBAE 1', nklcb0222(), false),
          post(context, 'NAKALICOUBAE 1', 'NAKALICOUBAE 1', nklcb0222(), false),
        ],
      ));
}
