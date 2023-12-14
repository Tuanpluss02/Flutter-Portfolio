import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'experience_mobile.dart';
import 'experience_web.dart';

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
    );
  }
}
