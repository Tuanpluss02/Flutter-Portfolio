import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../../../resource/app_assets.dart';
import '../../../../../resource/app_colors.dart';
import '../../../../../resource/app_resource.dart';
import '../../../../../utils/screen_info.dart';
import '../../bloc/hover_cubit.dart';

// ignore: must_be_immutable
class IntroWeb extends StatefulWidget {
  AutoScrollController aScrollController;

  IntroWeb(this.aScrollController, {super.key});

  @override
  State<IntroWeb> createState() => _IntroWebState();
}

class _IntroWebState extends State<IntroWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(
        left: ScreenInfo().getMqWidth(context) * 0.01,
        top: ScreenInfo().getMqHeight(context) * 0.1,
      ),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 600,
              width: 700,
              child: RiveWidgetBuilder(
                fileLoader: FileLoader.fromAsset(
                  AppAssets.handWritingRive,
                  riveFactory: Factory.flutter,
                ),
                builder: (context, state) {
                  if (state is RiveLoaded) {
                    return RiveWidget(controller: state.controller);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 50),
                    child: Text(
                      IntroScreenContents.welcomeTxt,
                      style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 18,
                        fontFamily: 'CircularStd',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      IntroScreenContents.name,
                      style: TextStyle(
                        color: AppColors().textColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        fontSize: 55,
                      ),
                    ),
                  ),
                  SizedBox(
                    width:
                        ScreenInfo().getMqWidth(context) -
                        (ScreenInfo().getMqWidth(context) * 0.23),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        IntroScreenContents.whatIdo,
                        style: TextStyle(
                          color: AppColors().textLight,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 55,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      width: ScreenInfo().getMqWidth(context) * 0.45,
                      child: RichText(
                        text: TextSpan(
                          text: IntroScreenContents.introAbout,
                          style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 18,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: IntroScreenContents.currentOrgName,
                              style: TextStyle(
                                color: AppColors().neonColor,
                                letterSpacing: 1,
                                height: 1.5,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 70),
                    child: BlocBuilder<HoverCubit, String>(
                      builder: (context, data) {
                        bool isHovered = (data == "checkout");
                        return InkWell(
                          onHover: (bol) {
                            if (bol) {
                              context.read<HoverCubit>().setHover("checkout");
                            } else {
                              context.read<HoverCubit>().setHover("");
                            }
                          },
                          onTap: () {
                            widget.aScrollController.scrollToIndex(
                              1,
                              preferPosition: AutoScrollPosition.begin,
                            );
                          },
                          child: Container(
                            height: ScreenInfo().getMqHeight(context) * 0.09,
                            width: ScreenInfo().getMqWidth(context) * 0.2,
                            decoration: BoxDecoration(
                              color: (isHovered
                                  ? AppColors().neonColor
                                  : Colors.transparent),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(45),
                              ),
                              border: Border.all(
                                color: AppColors().neonColor,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Check Out My Work!',
                                style: TextStyle(
                                  color: (isHovered
                                      ? Colors.black
                                      : AppColors().neonColor),
                                  fontSize: 13,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'CircularStd',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
