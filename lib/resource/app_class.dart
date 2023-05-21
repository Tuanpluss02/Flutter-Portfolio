import 'package:flutter/material.dart';
import 'package:my_portfolio/model/experience_model.dart';
import 'package:my_portfolio/model/work_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';
import 'styles.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static const resumeDownloadURL = '''https://t.me/Tuanpluss02''';

  List<WorkModel> projectList = [
    WorkModel(
        projectTitle: "URL Shortener",
        projectContent: "URL Shotener using Python with FastAPI.",
        tech1: "Python",
        tech2: "FastAPI",
        tech3: "MongoDB",
        link: "https://github.com/Tuanpluss02/URL-Shortener"),
    WorkModel(
        projectTitle: "URL Shortener Launcher",
        projectContent:
            '''URL Shortener Launcher is a web application that allows users to shorten long URLs into short and easy-to-remember links.''',
        tech1: "Flutter",
        tech2: "Rive",
        tech3: "Firebase",
        link: "https://github.com/Tuanpluss02/URL-Shortener-Launcher"),
    WorkModel(
        projectTitle: "Pro Chat",
        projectContent:
            "Pro Chat is a real-time messaging web application that allows users to chat with each other instantly.",
        tech1: "ReactJS",
        tech2: "FastAPI",
        tech3: "MongoDB",
        link: "https://github.com/Tuanpluss02/Pro-Chat"),
    WorkModel(
        projectTitle: "Pro Note",
        projectContent:
            '''The ultimate cross-platform note-taking application built with Flutter framework.''',
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "Dart",
        link: "https://github.com/Tuanpluss02/Pro-Note"),
    WorkModel(
        projectTitle: "SVD to Turtle",
        projectContent: '''Python code to convert SVG to Turtle draw''',
        tech1: "Python",
        tech2: "Turtle",
        tech3: "SVG",
        link: "https://github.com/Tuanpluss02/turtle-svg"),
    WorkModel(
        projectTitle: "Flutter Portfolio",
        projectContent: '''Source code of this portfolio''',
        tech1: "Flutter",
        tech2: "Firebase",
        tech3: "Rive",
        link: "https://github.com/Tuanpluss02/my-portfolio"),
  ];

  List<ExperienceModel> experienceList = [
    ExperienceModel(
        company: "Code MeLy",
        position: "Flutter Developer",
        duration: "2022 - Present",
        website: "https://codemely.tech/",
        jobs: [
          "Discord Admin.",
          "Content writer for company's blog.",
          "Developed Flutter application for clients.",
        ]),
    ExperienceModel(
        company: "T-Town",
        position: "Tech Lead",
        duration: "2020 - 2022",
        website: "https://t-town.tech/",
        jobs: [
          "Human Resource Manager.",
          "Content writer for company's blog.",
          "Developed Flutter application for company.",
        ]),
    ExperienceModel(
      company: "StormX",
      position: "Founder",
      duration: "2019 - Present",
      website: "https://stormx.software/",
      jobs: [
        "Design and develop the landing page using Flutter for web.",
        "Write articles about technology.",
        "Learn and research about new technology.",
      ],
    )
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors().neonColor),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Okay',
                        style: TextStyle(color: Colors.black),
                      ))
                ]));
  }
}
