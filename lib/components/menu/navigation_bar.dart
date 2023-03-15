import 'dart:async';
import 'package:aiia_webpage/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals.dart';

bool clicked = false;

// ignore: camel_case_types, must_be_immutable
class navigation_bar extends StatefulWidget {
  navigation_bar(this.responsiveWidth, this.getPage, this.getPost, {super.key});
  // ignore: prefer_typing_uninitialized_variables
  var responsiveWidth;
  Function getPage;
  Function getPost;

  @override
  State<navigation_bar> createState() => _navigation_barState();
}

class _navigation_barState extends State<navigation_bar> {
  void initState() {
    super.initState();
    // Rebuild the screen after 3s which will process the animation from green to blue
    Future.delayed(const Duration(seconds: 0)).then((value) => setState(() {
          clicked = !clicked;
        }));
  }

  Widget highLightBox(double size) {
    return Container(
      width: size,
      height: 5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF63E4E5),
            Color(0xFF8B7CE0),
          ],
        ),
      ),
    );
  }

  Widget getHighLight(String page, int n, String menu) {
    double size = 8;
    if (page == 'aiia_intro' || page == 'news') {
      size = highLightSize * 5 / 7;
    } else if (page == 'members' || page == 'contents') {
      size = highLightSize * 1.1;
    } else if (page == 'gallery' || page == 'about') {
      size = highLightSize * 6 / 7;
    }
    //var boxRatio = getHighLightSize(n, page);
    return pageNum == n && page == menu
        ? highLightBox(size)
        : Container(
            width: size,
            height: 0,
            color: const Color(0xff161c2a),
          );
  }

  Widget menu(String menu, String page, BuildContext context) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (page == 'aiia_intro') {
          widget.getPage(0);
        } else if (page == 'about') {
          widget.getPage(1);
        } else if (page == 'members') {
          widget.getPage(2);
        } else if (page == 'contents') {
          widget.getPage(3);
        } else if (page == 'news') {
          widget.getPage(4);
          widget.getPost(0);
        } else if (page == 'gallery') {
          widget.getPage(5);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: space),
        child: Column(
          children: [
            const SizedBox(
              height: 13,
            ),
            Text(menu,
                style: TextStyle(color: Colors.white, fontSize: fontSize)),
            const SizedBox(
              height: 8,
            ),
            getHighLight(page, 0, 'aiia_intro'),
            getHighLight(page, 1, 'about'),
            getHighLight(page, 2, 'members'),
            getHighLight(page, 3, 'contents'),
            getHighLight(page, 4, 'news'),
            getHighLight(page, 5, 'gallery'),
          ],
        ),
      ),
    );
  }

  Widget icon(Icon icon, String site) {
    return IconButton(
      icon: icon,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      onPressed: () async {
        var url = Uri.parse(site);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: h,
        child: Container(
          decoration: const BoxDecoration(color: Color(0xff161c2a), boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3.0,
              spreadRadius: 5.0,
            )
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SizedBox(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              'assets/logos/logo_nav1.png',
                              width: imageWidth,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            child: Image.asset(
                              'assets/logos/logo_nav2.png',
                              width: imageWidth * (3 / 2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      widget.getPage(0);
                    },
                  ),
                  isWeb == true
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //메뉴, 파일, context, isWeb, func.
                            menu(
                              'Main',
                              'aiia_intro',
                              context,
                            ),
                            menu(
                              'About',
                              'about',
                              context,
                            ),
                            menu(
                              'Members',
                              'members',
                              context,
                            ),
                            menu(
                              'Contents',
                              'contents',
                              context,
                            ),
                            menu(
                              'News',
                              'news',
                              context,
                            ),
                            menu(
                              'Gallery',
                              'gallery',
                              context,
                            ),
                            isWeb == true
                                ? const SizedBox(
                                    height: 40,
                                    child: VerticalDivider(
                                      thickness: 1.5,
                                      color: Colors.white,
                                    ),
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                            isWeb == true
                                ? icon(
                                    const Icon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.white,
                                    ),
                                    'https://www.instagram.com/aiia_lab/')
                                : const SizedBox(
                                    width: 0,
                                  ),
                            isWeb == true
                                ? icon(
                                    const Icon(
                                      FontAwesomeIcons.youtube,
                                      color: Colors.white,
                                    ),
                                    'https://www.youtube.com/@AIIA_GCU',
                                  )
                                : const SizedBox(
                                    width: 0,
                                  )
                          ],
                        )
                      : IconButton(
                          color: Colors.white,
                          onPressed: () {
                            scaffoldKey.currentState?.openEndDrawer();
                          },
                          icon: const Icon(Icons.menu))
                ],
              ),
              const Divider(
                height: 0,
                thickness: 4,
                color: Color(0xFF7F99E3),
              )
            ],
          ),
        ));
  }
}
