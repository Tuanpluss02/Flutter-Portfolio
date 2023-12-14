import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'work_mobile.dart';
import 'work_tab.dart';
import 'work_web.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tabView: const WorkTab(),
      webView: const WorkWeb(),
      mobileView: const WorkMobile(),
    );
  }
}
