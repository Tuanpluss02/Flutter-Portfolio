import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/responsive.dart';

import 'work_mobile.dart';
import 'work_web.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return Responsive(webView: const WorkWeb(), mobileView: const WorkMobile());
  }
}
