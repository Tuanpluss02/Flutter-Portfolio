import 'package:flutter/cupertino.dart';

import 'utils/screen_info.dart';

// ignore: must_be_immutable
class Responsive extends StatefulWidget {
  final Widget mobileView;
  final Widget webView;
  final Widget? tabView;

  const Responsive({
    super.key,
    required this.mobileView,
    this.tabView,
    required this.webView,
  });

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
      case ScreenType.web:
        return widget.webView;
    }
  }
}
