import 'package:flutter/material.dart';
import 'package:portfolio/resource/app_assets.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resource/app_colors.dart';
import '../../resource/app_resource.dart';
import '../../utils/screen_info.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({Key? key}) : super(key: key);

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  SMIBool? _onHoverDetect;
  StateMachineController? stateMachineController;

  void jump() {
    _onHoverDetect?.value = true;
  }

  void disjump() {
    _onHoverDetect?.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ScreenInfo().getMqHeight(context) - 70,
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
                          fontFamily: 'CircularStd'),
                    ),
                    Text(
                      ''' What's next?''',
                      style: TextStyle(
                          color: AppColors().neonColor,
                          fontSize: 18,
                          fontFamily: 'CircularStd'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Get In Touch',
                    style: TextStyle(
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
                    width: ScreenInfo().getMqWidth(context) * 0.45,
                    child: Text(
                      endTxt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors().textLight,
                        letterSpacing: 1,
                        height: 1.5,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // padding: const EdgeInsets.only(bottom: 20),
                  height: ScreenInfo().getMqHeight(context) * 0.2,
                  width: ScreenInfo().getMqWidth(context) * 0.5,
                  child: InkWell(
                    onTap: () async {
                      await launchUrl(Uri.parse(SocialLinks.linkedin));
                    },
                    onHover: (bol) {
                      if (bol) {
                        jump();
                      } else {
                        disjump();
                      }
                    },
                    child: Stack(children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: RiveAnimation.asset(
                            AppAssets.pupHelloRive,
                            onInit: (artboard) {
                              stateMachineController =
                                  StateMachineController.fromArtboard(
                                      artboard, 'State Machine 1');

                              if (stateMachineController != null) {
                                artboard.addController(stateMachineController!);
                                var inputListener =
                                    stateMachineController!.inputs as List;
                                _onHoverDetect = inputListener.first as SMIBool;
                              }
                            },
                            // artboard: _helloArtboard!,
                            // alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: ScreenInfo().getMqHeight(context) * 0.09,
                            right: 10),
                        child: Center(
                          child: Text('Say Hello!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors().primaryColor,
                                  fontSize: 25,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'CircularStd')),
                        ),
                      ),
                    ]),

                    //    ),
                    //  ),
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
                      fontFamily: 'CircularStd'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''Do Ngoc Tuan - 2024''',
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 12,
                        fontFamily: 'CircularStd'),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
