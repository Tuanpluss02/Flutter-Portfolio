import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'intro_mobile.dart';
import 'intro_web.dart';

// ignore: must_be_immutable
class IntroContent extends StatefulWidget {
  AutoScrollController aScrollController;

  IntroContent(this.aScrollController, {super.key});

  @override
  State<IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobileView: IntroMobile(widget.aScrollController),
      webView: IntroWeb(widget.aScrollController),
    );
  }
}
