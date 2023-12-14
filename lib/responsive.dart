import 'package:flutter/cupertino.dart';

import 'utils/screen_info.dart';

// ignore: must_be_immutable
class Responsive extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var mobileView, webView, tabView;

  Responsive({super.key, this.mobileView, this.tabView, this.webView});
  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    ScreenType scrType = ScreenInfo().getScreenType(context);
    switch (scrType) {
      case ScreenType.mobile:
        return widget.mobileView;
      case ScreenType.tab:
        return widget.tabView;
      case ScreenType.web:
        return widget.webView;
    }
  }
}
