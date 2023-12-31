import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/text_styles.dart';

class AppDialog {
  static BuildContext? lastContext;
  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
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
