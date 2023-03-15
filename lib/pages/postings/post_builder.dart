import 'package:aiia_webpage/components/footer.dart';
import 'package:aiia_webpage/components/globals.dart';
import 'package:flutter/material.dart';

Widget pTitle(String postTitle, Function getPost) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: SelectableText(
                  postTitle,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff161c2a)),
                  onPressed: () {
                    getPost(0);
                  },
                  child: const Text('돌아가기')),
            ],
          ),
        ]),
      ),
      const Divider(
        height: 20,
        thickness: 2,
        color: Colors.black,
      ),
    ],
  );
}

Widget pContents(String text, String fileName, Widget widget) {
  return SizedBox(
      width: postWidth * 8,
      child: Column(
        children: [
          SelectableText(text, style: const TextStyle(fontSize: 20)),
          fileName != 'null'
              ? Image.asset(
                  fileName,
                )
              : const SizedBox(
                  height: 0,
                ),
          widget
        ],
      ));
}

Widget post(String title, String text, String fileName, Function getPost,
    Widget widget) {
  return SizedBox(
      height: pageHeight - h,
      child: ListView(
        children: [
          pTitle(title, getPost),
          Row(
            children: [
              SizedBox(width: postWidth),
              pContents(text, fileName, widget),
              SizedBox(width: postWidth),
            ],
          ),
          const Footer()
        ],
      ));
}
