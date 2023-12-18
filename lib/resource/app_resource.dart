import 'package:portfolio/resource/app_assets.dart';

import '../model/experience_model.dart';
import '../model/social_model.dart';
import '../model/technology_model.dart';
import '../model/work_model.dart';

class IntroScreenContents {
  static const welcomeTxt = '''Hi, my name is''';
  static const name = '''Tuan Do.''';
  static const whatIdo = '''I build things for the mobile/web.''';
  static const introAbout =
      '''I’m a software engineer specializing in building (and occasionally designing) exceptional digital experiences. Currently, I’m focused on building accessible, human-centered products at ''';
  static const currentOrgName = '''Code MeLy.''';
}

class AboutScreenContents {
  static const aboutPara1 =
      '''Hello! My name is Tuan Do and I enjoy creating things that live on the internet. My interest in mobile development started back in 2021 when I decided to clone some applications — turns my passion into profession.''';
  static const aboutPara2 =
      '''Currently, I am a 4-year student at Posts and Telecommunications Institute of Technology. I work as a mobile developer at Code MeLy - an IT community in Vietnam.''';
  static const aboutPara3 =
      '''I also freelance for various clients across the world. If you've any ideas about creating a project or something, feel free to contact me!''';
  static const techIntro =
      '''Here are a few technologies I’ve been working with recently:''';
}

class SocialLinks {
  static const linkedin = "https://www.linkedin.com/in/Tuanpluss02";
  static const messenger = "https://m.me/tuanpluss02/";
  static const github = "https://github.com/Tuanpluss02";
  static const twitter = "";
  static const instagram = "https://www.instagram.com/tuanpluss02/";
  static const stackoverflow =
      "https://stackoverflow.com/users/15892425/tuan-plus";
}

const endTxt =
    '''Although I’m not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I’ll try my best to get back to you!''';

List<Social> socialLinksList = [
  Social(
      name: "LinkedIn",
      link: SocialLinks.linkedin,
      image: AppAssets.linkedinLogo,
      state: "linkedinHovered"),
  Social(
    name: "Github",
    link: SocialLinks.github,
    image: AppAssets.githubLogo,
    state: "githubHovered",
  ),
  Social(
      name: "Stack Overflow",
      image: AppAssets.stackoverflowLogo,
      link: SocialLinks.stackoverflow,
      state: "stackoverflowHovered"),
  Social(
      name: "Instagram",
      link: SocialLinks.instagram,
      image: AppAssets.instagramLogo,
      state: "instagramHovered"),
  Social(
      name: "X",
      image: AppAssets.twitterLogo,
      link: SocialLinks.twitter,
      state: "TwitterHovered"),
];

List<String> aboutScreenContentsList = [
  AboutScreenContents.aboutPara1,
  AboutScreenContents.aboutPara2,
  AboutScreenContents.aboutPara3,
  AboutScreenContents.techIntro,
];

List<Technology> technologiesList = [
  Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
  Technology(techName: 'Firebase', techLogo: AppAssets.firebaseLogo),
  Technology(techName: 'NestJS', techLogo: AppAssets.nestjsLogo),
  Technology(techName: 'MongoDB', techLogo: AppAssets.mongoDBLogo),
  Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
  Technology(techName: 'Docker', techLogo: AppAssets.dockerLogo),
];

List<WorkModel> projectList = [
  WorkModel(
      projectTitle: "URL Shortener Backend",
      projectContent:
          '''Backend for URL Shortener Launcher. Using NestJS and MongoDB for database. This project provides a robust and scalable backend infrastructure for the URL Shortener Launcher web application. It handles the creation and management of shortened URLs, as well as the storage and retrieval of data from the MongoDB database. The Nestjs framework is used to build the RESTful API endpoints, while MongoDB serves as the persistent data storage. With this backend implementation, the URL Shortener Launcher can efficiently handle a large number of requests and ensure the reliability and security of the shortened URLs.''',
      techs: [
        Technology(techName: 'NestJS', techLogo: AppAssets.nestjsLogo),
        Technology(techName: 'MongoDB', techLogo: AppAssets.mongoDBLogo),
        Technology(techName: 'Docker', techLogo: AppAssets.dockerLogo),
      ],
      link: "https://github.com/Tuanpluss02/URL-Shortener-Backend"),
  WorkModel(
      projectTitle: "URL Shortener Launcher",
      projectContent:
          '''URL Shortener Launcher is a web application that allows users to shorten long URLs into short and easy-to-remember links.''',
      techs: [
        Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
        Technology(techName: 'Firebase', techLogo: AppAssets.firebaseLogo),
        Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
      ],
      link: "https://github.com/Tuanpluss02/URL-Shortener-Launcher"),
  WorkModel(
      projectTitle: "Pro Note",
      projectContent:
          '''The ultimate cross-platform note-taking application built with Flutter framework.''',
      techs: [
        Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
        Technology(techName: 'Firebase', techLogo: AppAssets.firebaseLogo),
        Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
      ],
      link: "https://github.com/Tuanpluss02/Pro-Note"),
  WorkModel(
      projectTitle: "SVG to Turtle",
      projectContent:
          '''The script reads an SVG file and extracts the path data from it. It then converts the path data into a series of Turtle draw commands that can be executed by a Turtle graphics library. This enables you to take advantage of the rich graphics capabilities offered by SVG files and replicate them using the Turtle graphics library.''',
      techs: [
        Technology(techName: 'Python', techLogo: AppAssets.folderLogo),
        Technology(techName: 'SVG', techLogo: AppAssets.folderLogo),
        Technology(techName: 'Turlte', techLogo: AppAssets.folderLogo)
      ],
      link: "https://github.com/Tuanpluss02/turtle-svg"),
  WorkModel(
      projectTitle: "Flutter Portfolio",
      projectContent:
          '''My portfolio built using Flutter, an open-source UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. This portfolio showcases my skills and experiences as a Flutter developer.''',
      techs: [
        Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
        Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
        Technology(techName: "Firebase", techLogo: AppAssets.firebaseLogo)
      ],
      link: "https://github.com/Tuanpluss02/my-portfolio"),
];

List<ExperienceModel> experienceList = [
  ExperienceModel(
      company: "Code MeLy",
      position: "Developer",
      duration: "2022 - Present",
      website: "https://codemely.dev/",
      jobs: [
        "Discord Admin.",
        "Content writer.",
        "Develop Flutter application for clients.",
      ]),
  ExperienceModel(
      company: "T-Town",
      position: "Developer",
      duration: "2020 - 2022",
      website: "",
      jobs: [
        "Human Resource Manager.",
        "Content writer for company's blog.",
        "Develop Flutter application for company.",
      ]),
  ExperienceModel(
    company: "StormX",
    position: "Developer",
    duration: "2019 - Present",
    website: "https://stormx.works/",
    jobs: [
      "Design and develop the landing page using Flutter for web.",
      "Write articles about technology.",
      "Learn and research about new technology.",
    ],
  )
];
