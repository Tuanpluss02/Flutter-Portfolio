import 'package:flutter/material.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/view/experience/experienceMobile.dart';
import 'package:my_portfolio/view/experience/experienceTab.dart';

import 'experienceWeb.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: const ExperienceWeb(),
      mobileView: const ExperienceMobile(),
      tabView: const ExperienceTab(),
    );
  }
}
