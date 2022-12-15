import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/view/contact/contactMobile.dart';
import 'package:my_portfolio/view/contact/contactTab.dart';
import 'package:my_portfolio/view/contact/contactWeb.dart';

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
