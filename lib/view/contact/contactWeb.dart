import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/controller/generalController.dart';
import 'package:my_portfolio/resource/appClass.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resource/colors.dart';
import '../../resource/strings.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({Key? key}) : super(key: key);

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppClass().getMqHeight(context) - 70,
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
                        fontSize: 15,
                        fontFamily: 'sfmono'),
                  ),
                  Text(
                    ''' What's next?''',
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 18,
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
                    fontSize: 55,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: AppClass().getMqWidth(context) * 0.45,
                  child: Text(
                    Strings.endTxt,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: AppColors().textLight,
                      letterSpacing: 1,
                      height: 1.5,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 70),
                child: Consumer(builder: (context, ref, child) {
                  var data = ref.watch(hoverProvider);
                  bool isHovered = (data == "hello");
                  return InkWell(
                    onTap: () async {
                      await launchUrl(
                          Uri.parse("https://m.me/tuanpluss.stormX/"));
                    },
                    onHover: (bol) {
                      if (bol) {
                        ref.read(hoverProvider.notifier).state = "hello";
                      } else {
                        ref.read(hoverProvider.notifier).state = "";
                      }
                    },
                    child: Container(
                      height: AppClass().getMqHeight(context) * 0.09,
                      width: AppClass().getMqWidth(context) * 0.15,
                      decoration: BoxDecoration(
                          color: (isHovered
                              ? AppColors().neonColor
                              : Colors.transparent),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3.0)),
                          border: Border.all(
                              color: AppColors().neonColor, width: 1.5)),
                      child: Center(
                        child: Text('Say Hello!',
                            style: TextStyle(
                                color: (isHovered
                                    ? Colors.black
                                    : AppColors().neonColor),
                                fontSize: 13,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'sfmono')),
                      ),
                    ),
                  );
                }),
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
                  '''Do Ngoc Tuan - 2022''',
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
