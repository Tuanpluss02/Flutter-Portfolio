import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'about_mobile.dart';
import 'about_tab.dart';
import 'about_web.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: const AboutWeb(),
      tabView: const AboutTab(),
      mobileView: const AboutMobile(),
    );
  }
}
