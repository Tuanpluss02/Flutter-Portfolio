// ignore_for_file: file_names

import 'package:url_launcher/url_launcher.dart';

import '../resource/app_resource.dart';

downloadResume(context) async {
  await launchUrl(Uri.parse(SocialLinks.linkedin));
}
