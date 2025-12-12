import 'package:flutter/material.dart';
import 'package:portfolio/resource/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class RightPane extends StatefulWidget {
  const RightPane({super.key});

  @override
  State<RightPane> createState() => _RightPaneState();
}

class _RightPaneState extends State<RightPane> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: InkWell(
                      onTap: () async {
                        await launchUrl(
                          Uri.parse("mailto:tuando@stormxplus.onmicrosoft.com"),
                        );
                      },
                      child: Text(
                        'tuando@stormxplus.onmicrosoft.com',
                        style: TextStyle(
                          letterSpacing: 1,
                          color: AppColors().textColor,
                          fontSize: 14,
                          fontFamily: 'CircularStd',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container(width: 1, color: Colors.white)),
        ],
      ),
    );
  }
}
