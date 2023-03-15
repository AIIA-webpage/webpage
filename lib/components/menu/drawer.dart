import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types, must_be_immutable
class drawer extends StatelessWidget {
  drawer(this.getPage, this.getPost, {super.key});
  Function getPage;
  Function getPost;

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

  Widget menu(String menu, String page, BuildContext context) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pop();
        if (page == 'aiia_intro') {
          getPage(0);
        } else if (page == 'about') {
          getPage(1);
        } else if (page == 'members') {
          getPage(2);
        } else if (page == 'contents') {
          getPage(3);
        } else if (page == 'news') {
          getPage(4);
          getPost(0);
        } else if (page == 'gallary') {
          getPage(5);
        }
      },
      child: Column(
        children: [
          const SizedBox(
            height: 13,
          ),
          Text(menu, style: const TextStyle(color: Colors.white, fontSize: 20)),
          const SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                color: const Color(0xFF7F99E3),
                height: 30,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    color: const Color(0xff161c2a),
                    width: double.infinity,
                    height: 900,
                    child: Column(children: [
                      Container(
                        height: 60,
                        color: const Color(0xFF7F99E3),
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      menu('Home', 'aiia_intro', context),
                      menu('About', 'about', context),
                      menu('Members', 'members', context),
                      menu('Contents', 'contents', context),
                      menu('News', 'news', context),
                      menu('Gallary', 'gallary', context),
                      const SizedBox(
                        height: 250,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 200,
                          ),
                          icon(
                              const Icon(
                                FontAwesomeIcons.instagram,
                                color: Colors.white,
                              ),
                              'https://www.instagram.com/aiia_lab/'),
                          icon(
                              const Icon(
                                FontAwesomeIcons.youtube,
                                color: Colors.white,
                              ),
                              'https://www.youtube.com/@AIIA_GCU'),
                        ],
                      )
                    ]),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF7F99E3),
                        width: 5.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/logos/circle_logo1.png',
                      ),
                      backgroundColor: Color(0xFF7F99E3),
                      radius: 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
