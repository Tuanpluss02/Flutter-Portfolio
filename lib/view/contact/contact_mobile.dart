import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resource/app_colors.dart';
import '../../resource/app_resource.dart';
import '../../utils/screen_info.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({Key? key}) : super(key: key);

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenInfo().getMqHeight(context) - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '''04.''',
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 12,
                        fontFamily: 'sfmono'),
                  ),
                  Text(
                    ''' What's next?''',
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 14,
                        fontFamily: 'sfmono'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Get In Touch',
                  style: GoogleFonts.robotoSlab(
                    color: AppColors().textColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: ScreenInfo().getMqWidth(context) * 0.55,
                  child: Text(
                    endTxt,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: AppColors().textLight,
                      letterSpacing: 1,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  launchUrl(Uri.parse(SocialLinks.messenger));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: ScreenInfo().getMqHeight(context) * 0.09,
                  width: ScreenInfo().getMqWidth(context) * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(3.0)),
                      border:
                          Border.all(color: AppColors().neonColor, width: 1.5)),
                  child: Center(
                    child: Text('Say Hello!',
                        style: TextStyle(
                            color: AppColors().neonColor,
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sfmono')),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                '''Thanks for visit my website''',
                style: TextStyle(
                    color: AppColors().textColor,
                    fontSize: 12,
                    fontFamily: 'sfmono'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''Do Ngoc Tuan - 2023''',
                  style: TextStyle(
                      color: AppColors().neonColor,
                      fontSize: 12,
                      fontFamily: 'sfmono'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
