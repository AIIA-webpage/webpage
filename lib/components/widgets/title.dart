import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';

Widget titleSet(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Divider(
        height: 30.0,
        color: Colors.black,
        thickness: 0.5,
        endIndent: 0.0,
      ),
      const SizedBox(
        height: 10,
      ),
      Wrap(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: groupName,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ],
  );
}

Widget subTitle(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    ],
  );
}
