import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../responsive.dart';
import 'intro_mobile.dart';
import 'intro_tab.dart';
import 'intro_web.dart';

// ignore: must_be_immutable
class IntroContent extends StatefulWidget {
  AutoScrollController aScrollController;

  IntroContent(this.aScrollController, {Key? key}) : super(key: key);

  @override
  State<IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<IntroContent> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: IntroTab(widget.aScrollController),
      mobileView: IntroMobile(widget.aScrollController),
      webView: IntroWeb(widget.aScrollController),
    );
  }
}
