import 'package:flutter/material.dart';
import 'package:portfolio/resource/app_assets.dart';
import 'package:portfolio/resource/app_colors.dart';
import 'package:portfolio/resource/app_resource.dart';
import 'package:portfolio/utils/screen_info.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  RiveWidgetController? _controller;
  BooleanInput? _hoverInput;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onRiveLoaded(RiveLoaded state) {
    _controller = state.controller;
    // Find the hover boolean input in the state machine
    final stateMachine = _controller?.stateMachine;
    if (stateMachine != null) {
      // ignore: deprecated_member_use
      for (final input in stateMachine.inputs) {
        if (input is BooleanInput) {
          _hoverInput = input;
          break;
        }
      }
    }
  }

  void _setHover(bool value) {
    _hoverInput?.value = value;
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
                      fontFamily: 'CircularStd',
                    ),
                  ),
                  Text(
                    ''' What's next?''',
                    style: TextStyle(
                      color: AppColors().neonColor,
                      fontSize: 18,
                      fontFamily: 'CircularStd',
                    ),
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
                height: ScreenInfo().getMqHeight(context) * 0.2,
                width: ScreenInfo().getMqWidth(context) * 0.5,
                child: InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse(SocialLinks.linkedin));
                  },
                  onHover: (isHovered) {
                    _setHover(isHovered);
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: RiveWidgetBuilder(
                            fileLoader: FileLoader.fromAsset(
                              AppAssets.pupHelloRive,
                              riveFactory: Factory.flutter,
                            ),
                            stateMachineSelector: StateMachineSelector.byName(
                              'State Machine 1',
                            ),
                            onLoaded: _onRiveLoaded,
                            builder: (context, state) {
                              if (state is RiveLoaded) {
                                return RiveWidget(controller: state.controller);
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: ScreenInfo().getMqHeight(context) * 0.09,
                          right: 10,
                        ),
                        child: Center(
                          child: Text(
                            'Say Hello!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors().primaryColor,
                              fontSize: 25,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CircularStd',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '''Thanks for visit my website''',
                style: TextStyle(
                  color: AppColors().textColor,
                  fontSize: 12,
                  fontFamily: 'CircularStd',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''Do Ngoc Tuan - 2024''',
                  style: TextStyle(
                    color: AppColors().neonColor,
                    fontSize: 12,
                    fontFamily: 'CircularStd',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
