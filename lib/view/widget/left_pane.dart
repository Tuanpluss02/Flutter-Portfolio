// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/resource/app_resource.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/general_controller.dart';
import '../../resource/app_colors.dart';
import '../../utils/screen_info.dart';

class LeftPane extends ConsumerStatefulWidget {
  const LeftPane({Key? key}) : super(key: key);

  @override
  ConsumerState<LeftPane> createState() => _LeftPaneState();
}

class _LeftPaneState extends ConsumerState<LeftPane> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Consumer(builder: (context, ref, child) {
                  String val = ref.watch(hoverProvider);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: socialLinksList
                            .map(
                              (item) => SizedBox(
                                height:
                                    ScreenInfo().getMqHeight(context) * 0.07,
                                child: InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse(item.link));
                                  },
                                  onHover: (bol) {
                                    if (bol) {
                                      ref.read(hoverProvider.notifier).state =
                                          item.state;
                                    } else {
                                      ref.read(hoverProvider.notifier).state =
                                          "";
                                    }
                                  },
                                  child: AnimatedContainer(
                                    margin: EdgeInsets.only(
                                        bottom: val == item.state ? 5.0 : 0),
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    duration: const Duration(milliseconds: 300),
                                    child: SvgPicture.asset(item.image,
                                        color: val == item.state
                                            ? AppColors().neonColor
                                            : AppColors().textColor,
                                        width: 22),
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  );
                })),
            Expanded(
                child: Container(
              width: 1,
              color: AppColors().textColor,
            ))
          ],
        ));
  }
}
