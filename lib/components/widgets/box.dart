import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';

Widget box(String title, String content) {
  return Column(
    children: [
      const Divider(
        height: 40,
        thickness: 1.5,
        color: Colors.black,
      ),
      Container(
        margin: EdgeInsets.all(10),
        child: Wrap(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(title,
                style: TextStyle(
                    fontSize: titleSize, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          content,
          style: const TextStyle(fontSize: 20),
        ),
      )
    ],
  );
}
