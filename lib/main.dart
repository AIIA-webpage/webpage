import 'package:aiia_webpage/components/centered_view.dart';
import 'package:aiia_webpage/components/menu/drawer.dart';
import 'package:aiia_webpage/components/menu/navigation_bar.dart';
import 'package:aiia_webpage/pages/about.dart';
import 'package:aiia_webpage/pages/aiia_intro.dart';
import 'package:aiia_webpage/pages/contents.dart';
import 'package:aiia_webpage/pages/gallery.dart';
import 'package:aiia_webpage/pages/members.dart';
import 'package:aiia_webpage/pages/news.dart';  
import 'package:aiia_webpage/pages/postings/postings.dart';
import 'package:flutter/material.dart';
import 'components/globals.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void main() => runApp(const MyApp());
int pageNum = 0;
int postNum = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AIIA MAIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Open Sans',
              )),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void getPage(int returnNum) {
    setState(() {
      pageNum = returnNum;
    });
  }

  void getPost(int returnNum) {
    setState(() {
      postNum = returnNum;
    });
  }

  Widget getWidget(BuildContext context) {
    if (pageNum == 0) {
      return const AiiaIntro();
    } else if (pageNum == 1) {
      return About();
    } else if (pageNum == 2) {
      return Members(isWeb);
    } else if (pageNum == 3) {
      return Column(
        children: [Contents(context)],
      );
    } else if (pageNum == 4) {
      return News(getPost);
    } else if (pageNum == 5) {
      return const Gallery();
    }
    return const AiiaIntro();
  }

  Widget getPosting(BuildContext context) {
    if (postNum == 0) {
      return News(getPost);
    } else if (postNum == 1) {
      return P0108(getPost);
    } else if (postNum == 2) {
      return P0209(getPost);
    } else if (postNum == 3) {
      return P0214(getPost);
    } else if (postNum == 4) {
      return P0216(getPost);
    }
    return News(getPage);
  }

  @override
  Widget build(BuildContext context) {
    var responsiveWidth = MediaQuery.of(context).size.width;
    var responsiveHeight = MediaQuery.of(context).size.height;
    getSize(responsiveWidth, responsiveHeight);
    // ignore: avoid_print
    print('width : $responsiveWidth');
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: CenteredView(
        isWeb: isWeb,
        child: Column(
          children: [
            navigation_bar(responsiveWidth, getPage, getPost),
            Expanded(
                child: pageNum == 4 ? getPosting(context) : getWidget(context)),
          ],
        ),
      ),
      endDrawer: drawer(getPage, getPost),
    );
  }
}
