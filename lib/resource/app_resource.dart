import 'package:portfolio/features/portfolio/domain/entities/experience_model.dart';
import 'package:portfolio/features/portfolio/domain/entities/social_model.dart';
import 'package:portfolio/features/portfolio/domain/entities/technology_model.dart';
import 'package:portfolio/features/portfolio/domain/entities/work_model.dart';
import 'package:portfolio/resource/app_assets.dart';

/// Intro screen content strings
abstract final class IntroScreenContents {
  static const welcomeTxt = 'Hi, my name is';
  static const name = 'Tuan Do.';
  static const whatIdo = 'I build things for the mobile/web.';
  static const introAbout =
      "I'm a software engineer specializing in building (and occasionally designing) exceptional digital experiences. Currently, I'm focused on building accessible, human-centered products at ";
  static const currentOrgName = 'Code MeLy.';
}

/// About screen content strings
abstract final class AboutScreenContents {
  static const aboutPara1 =
      'Hello! My name is Tuan Do and I enjoy creating things that live on the internet. My interest in mobile development started back in 2021 when I decided to clone some applications — turns my passion into profession.';
  static const aboutPara2 =
      'Currently, I am a 4-year student at Posts and Telecommunications Institute of Technology. I work as a mobile developer at Code MeLy - an IT community in Vietnam.';
  static const aboutPara3 =
      "I also freelance for various clients across the world. If you've any ideas about creating a project or something, feel free to contact me!";
  static const techIntro =
      "Here are a few technologies I've been working with recently:";

  static const List<String> paragraphs = [
    aboutPara1,
    aboutPara2,
    aboutPara3,
    techIntro,
  ];
}

/// Social media links
abstract final class SocialLinks {
  static const linkedin = 'https://www.linkedin.com/in/Tuanpluss02';
  static const github = 'https://github.com/Tuanpluss02';
  static const twitter = '';
  static const instagram = 'https://www.instagram.com/tuanpluss02/';
  static const stackoverflow =
      'https://stackoverflow.com/users/15892425/tuan-plus';
}

/// Contact section ending text
const endTxt =
    "Although I'm not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!";

/// Social links data
const List<Social> socialLinksList = [
  Social(
    name: 'LinkedIn',
    link: SocialLinks.linkedin,
    image: AppAssets.linkedinLogo,
    state: 'linkedinHovered',
  ),
  Social(
    name: 'Github',
    link: SocialLinks.github,
    image: AppAssets.githubLogo,
    state: 'githubHovered',
  ),
  Social(
    name: 'Stack Overflow',
    image: AppAssets.stackoverflowLogo,
    link: SocialLinks.stackoverflow,
    state: 'stackoverflowHovered',
  ),
  Social(
    name: 'Instagram',
    link: SocialLinks.instagram,
    image: AppAssets.instagramLogo,
    state: 'instagramHovered',
  ),
  Social(
    name: 'X',
    image: AppAssets.twitterLogo,
    link: SocialLinks.twitter,
    state: 'TwitterHovered',
  ),
];

/// Technologies data
const List<Technology> technologiesList = [
  Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
  Technology(techName: 'Firebase', techLogo: AppAssets.firebaseLogo),
  Technology(techName: 'NestJS', techLogo: AppAssets.nestjsLogo),
  Technology(techName: 'MongoDB', techLogo: AppAssets.mongoDBLogo),
  Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
  Technology(techName: 'Docker', techLogo: AppAssets.dockerLogo),
];

/// Projects data
const List<WorkModel> projectList = [
  WorkModel(
    projectTitle: 'StormX Link Backend',
    projectContent:
        'Backend for StormX Link. Using NestJS and MongoDB for database. This project provides a robust and scalable backend infrastructure for the StormX Link web application.',
    techs: [
      Technology(techName: 'NestJS', techLogo: AppAssets.nestjsLogo),
      Technology(techName: 'MongoDB', techLogo: AppAssets.mongoDBLogo),
      Technology(techName: 'Docker', techLogo: AppAssets.dockerLogo),
    ],
    link: 'https://github.com/Tuanpluss02/StormX-Link-Backend',
  ),
  WorkModel(
    projectTitle: 'StormX Link',
    projectContent:
        'StormX Link is a web application that allows users to shorten long URLs into short and easy-to-remember links.',
    techs: [
      Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
      Technology(techName: 'Firebase', techLogo: AppAssets.firebaseLogo),
      Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
    ],
    link: 'https://github.com/Tuanpluss02/StormX-Link',
  ),
  WorkModel(
    projectTitle: 'Flutter Portfolio',
    projectContent:
        'My portfolio built using Flutter, an open-source UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. This portfolio showcases my skills and experiences as a Flutter developer.',
    techs: [
      Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
      Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
      Technology(techName: 'Firebase', techLogo: AppAssets.firebaseLogo),
    ],
    link: 'https://github.com/Tuanpluss02/Flutter-Portfolio',
  ),
  WorkModel(
    projectTitle: 'Pro Note',
    projectContent:
        'The ultimate cross-platform note-taking application built with Flutter framework. Pro Notes helps you stay organized and on top of your game with its simple and clean interface, and powerful features.',
    techs: [
      Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
      Technology(techName: 'Firebase', techLogo: AppAssets.firebaseLogo),
      Technology(techName: 'Rive', techLogo: AppAssets.riveLogo),
    ],
    link: 'https://github.com/Tuanpluss02/Pro-Note',
  ),
  WorkModel(
    projectTitle: 'SVG to Turtle',
    projectContent:
        'The script reads an SVG file and extracts the path data from it. It then converts the path data into a series of Turtle draw commands that can be executed by a Turtle graphics library.',
    techs: [
      Technology(techName: 'Python', techLogo: AppAssets.pythonLogo),
      Technology(techName: 'Vectorizer', techLogo: AppAssets.vectorizerLogo),
    ],
    link: 'https://github.com/Tuanpluss02/turtle-svg',
  ),
  WorkModel(
    projectTitle: 'COVID-19 Tracker',
    projectContent:
        'The COVID-19 Tracker is an efficient mobile application designed to provide real-time data and statistics on the COVID-19 pandemic.',
    techs: [
      Technology(techName: 'Flutter', techLogo: AppAssets.flutterLogo),
      Technology(techName: 'Dart', techLogo: AppAssets.dartLogo),
    ],
    link: 'https://github.com/Tuanpluss02/Covid19-Tracker/tree/main',
  ),
];

/// Experience data
const List<ExperienceModel> experienceList = [
  ExperienceModel(
    company: 'Code MeLy',
    position: 'Developer',
    duration: '2022 - Present',
    website: 'https://codemely.dev/',
    jobs: [
      'Discord Admin.',
      'Content writer.',
      'Develop Flutter application for clients.',
    ],
  ),
  ExperienceModel(
    company: 'T-Town',
    position: 'Developer',
    duration: '2020 - 2022',
    website: '',
    jobs: [
      'Human Resource Manager.',
      "Content writer for company's blog.",
      'Develop Flutter application for company.',
    ],
  ),
  ExperienceModel(
    company: 'StormX',
    position: 'Developer',
    duration: '2019 - Present',
    website: 'https://stormx.works/',
    jobs: [
      'Design and develop the landing page using Flutter for web.',
      'Write articles about technology.',
      'Learn and research about new technology.',
    ],
  ),
];
