import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../resource/app_resource.dart';
import '../../resource/app_colors.dart';
import '../../utils/screen_info.dart';

class IntroMobile extends StatefulWidget {
  final AutoScrollController aScrollController;

  const IntroMobile(this.aScrollController, {Key? key}) : super(key: key);

  @override
  State<IntroMobile> createState() => _IntroMobileState();
}

class _IntroMobileState extends State<IntroMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: ScreenInfo().getMqHeight(context) - 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  IntroScreenContents.welcomeTxt,
                  style: TextStyle(
                      color: AppColors().neonColor,
                      fontSize: 16,
                      fontFamily: 'CircularStd'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  IntroScreenContents.name,
                  style: TextStyle(
                    color: AppColors().textColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                width: ScreenInfo().getMqWidth(context) -
                    (ScreenInfo().getMqWidth(context) * 0.23),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    IntroScreenContents.whatIdo,
                    style: TextStyle(
                      color: AppColors().textLight,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: ScreenInfo().getMqWidth(context) * 0.6,
                  child: RichText(
                      text: TextSpan(
                          text: IntroScreenContents.introAbout,
                          style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 15,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: IntroScreenContents.currentOrgName,
                          style: TextStyle(
                            color: AppColors().neonColor,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 15,
                          ),
                        )
                      ])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: InkWell(
                  onTap: () {
                    widget.aScrollController.scrollToIndex(1,
                        preferPosition: AutoScrollPosition.begin);
                  },
                  child: Container(
                    height: ScreenInfo().getMqHeight(context) * 0.09,
                    width: ScreenInfo().getMqWidth(context) * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3.0)),
                        border: Border.all(
                            color: AppColors().neonColor, width: 1.5)),
                    child: Center(
                      child: Text('Check Out My Work!',
                          style: TextStyle(
                              color: AppColors().neonColor,
                              fontSize: 13,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CircularStd')),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
