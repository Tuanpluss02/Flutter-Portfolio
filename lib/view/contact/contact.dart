import 'package:flutter/cupertino.dart';

import '../../responsive.dart';
import 'contact_mobile.dart';
import 'contact_tab.dart';
import 'contact_web.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      webView: const ContactWeb(),
      tabView: const ContactTab(),
      mobileView: const ContactMobile(),
    );
  }
}
