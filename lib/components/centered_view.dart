import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CenteredView extends StatelessWidget {
  final Widget child;
  CenteredView({Key? key, required this.isWeb, required this.child})
      : super(key: key);
  bool isWeb;
  double hor = 50, ver = 40;

  @override
  Widget build(BuildContext context) {
    if (isWeb == true) {
      hor = 50;
      ver = 5;
    } else {
      hor = 0;
      ver = 0;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(
          //maxWidth: 1800,
          ),
      child: child,
    );
  }
}
