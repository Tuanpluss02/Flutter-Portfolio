import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resource/app_class.dart';
import '../../resource/app_messages.dart';
import '../../resource/colors.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppClass().getMqWidth(context) * 0.1,
          right: AppClass().getMqWidth(context) * 0.1),
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: "01.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'sfmono'),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' About Me',
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
              Container(
                height: 0.5,
                margin: const EdgeInsets.only(left: 15),
                width: AppClass().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...aboutScreenContentsList.map((content) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          content,
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 15,
                          ),
                        ),
                      );
                    }).toList(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          childAspectRatio: 10,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.arrow_right),
                                Text(' Flutter',
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.arrow_right),
                                Text(Strings.tech2,
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.arrow_right),
                                Text(Strings.tech3,
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.arrow_right),
                                Text(Strings.tech4,
                                    style: GoogleFonts.robotoFlex(
                                      color: AppColors().textLight,
                                      letterSpacing: 1,
                                      height: 1.5,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
