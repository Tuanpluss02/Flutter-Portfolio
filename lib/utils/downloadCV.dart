// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resource/app_resource.dart';

Future<void> downloadResume(BuildContext context) async {
  await launchUrl(Uri.parse(SocialLinks.linkedin));
}
