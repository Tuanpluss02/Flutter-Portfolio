import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resource/app_colors.dart';

class RightPane extends StatefulWidget {
  const RightPane({Key? key}) : super(key: key);

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
                                  Uri.parse("mailto:tuando@stormx.works"));
                            },
                            child: Text(
                              'tuando@stormx.works',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: AppColors().textColor,
                                  fontSize: 14,
                                  fontFamily: 'CircularStd'),
                            ),
                          )),
                    )
                  ],
                )),
            Expanded(
                child: Container(
              width: 1,
              color: Colors.white,
            ))
          ],
        ));
  }
}
