import 'package:flutter/material.dart';

import '../../components/globals.dart';
import '../gallery.dart';

Widget nklcb0222() {
  return Image.asset(
    'assets/logos/NaKa.png',
    fit: BoxFit.cover,
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
