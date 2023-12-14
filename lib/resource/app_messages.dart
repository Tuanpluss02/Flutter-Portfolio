class Technologies {
  final String techName;
  final String techLogo;
  Technologies({required this.techName, required this.techLogo});
}

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

const endTxt =
    '''Although I’m not currently looking for any new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I’ll try my best to get back to you!''';

List<String> introScreenContentsList = [
  IntroScreenContents.welcomeTxt,
  IntroScreenContents.name,
  IntroScreenContents.whatIdo,
  IntroScreenContents.introAbout,
  IntroScreenContents.currentOrgName,
];

List<String> aboutScreenContentsList = [
  AboutScreenContents.aboutPara1,
  AboutScreenContents.aboutPara2,
  AboutScreenContents.aboutPara3,
  AboutScreenContents.techIntro,
];

List<Technologies> technologiesList = [
  Technologies(techName: 'Flutter', techLogo: 'assets/images/tech/flutter.png'),
  Technologies(
      techName: 'Firebase', techLogo: 'assets/images/tech/firebase.png'),
  Technologies(techName: 'NestJS', techLogo: 'assets/images/tech/nestjs.png'),
  Technologies(techName: 'Rive', techLogo: 'assets/images/tech/rive.png'),
];
