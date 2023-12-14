import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../controller/general_controller.dart';
import '../../resource/app_class.dart';
import '../../resource/appbar_items.dart';
import '../../resource/colors.dart';

class ActionBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  final AutoScrollController controller;

  const ActionBar(this.controller, {Key? key}) : super(key: key);

  @override
  ConsumerState<ActionBar> createState() => _ActionBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ActionBarState extends ConsumerState<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: const EdgeInsets.only(right: 20.0, top: 25.0),
        child: () {
          ScreenType scrType = AppClass().getScreenType(context);
          if (scrType == ScreenType.mobile || scrType == ScreenType.tab) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
                        child: SvgPicture.asset(
                          'svg/Stormx_logo.svg',
                          height: 30,
                        ))),
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton(
                        color: AppColors().cardColor,
                        itemBuilder: (c) => <PopupMenuEntry>[
                          for (var item in appBarItems)
                            PopupMenuItem(
                              child: InkWell(
                                onTap: () => widget.controller.scrollToIndex(
                                    item.index,
                                    preferPosition: AutoScrollPosition.begin),
                                child: SizedBox(
                                    width: 90.0,
                                    child: Row(
                                      children: [
                                        item.icon,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            item.title,
                                            style: GoogleFonts.roboto(),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                        ],
                        child: const Icon(Icons.menu_rounded, size: 25),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return Row(
            children: [
              Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    'svg/Stormx_logo.svg',
                  )),
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /*Text(scrType.name),*/
                    InkWell(
                      onTap: () {
                        widget.controller.scrollToIndex(1,
                            preferPosition: AutoScrollPosition.begin);
                      },
                      onHover: (bol) {
                        if (bol) {
                          ref.read(hoverProvider.notifier).state = "aboutTitle";
                        } else {
                          ref.read(hoverProvider.notifier).state = "";
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Text("01. ",
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 13,
                                    fontFamily: 'sfmono')),
                            Consumer(builder: (context, ref, child) {
                              String state = ref.watch(hoverProvider);
                              bool isHovered = (state == "aboutTitle");
                              return Text("About",
                                  style: TextStyle(
                                      color: isHovered
                                          ? AppColors().neonColor
                                          : AppColors().textColor,
                                      fontSize: 13,
                                      fontFamily: 'sfmono'));
                            }),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.controller.scrollToIndex(2,
                            preferPosition: AutoScrollPosition.begin);
                      },
                      onHover: (bol) {
                        if (bol) {
                          ref.read(hoverProvider.notifier).state = "expTitle";
                        } else {
                          ref.read(hoverProvider.notifier).state = "";
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Text("02. ",
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 13,
                                    fontFamily: 'sfmono')),
                            Consumer(builder: (context, ref, child) {
                              String state = ref.watch(hoverProvider);
                              bool isHovered = (state == "expTitle");
                              return Text("Experience",
                                  style: TextStyle(
                                      color: isHovered
                                          ? AppColors().neonColor
                                          : AppColors().textColor,
                                      fontSize: 13,
                                      fontFamily: 'sfmono'));
                            }),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.controller.scrollToIndex(3,
                            preferPosition: AutoScrollPosition.begin);
                      },
                      onHover: (bol) {
                        if (bol) {
                          ref.read(hoverProvider.notifier).state = "workTitle";
                        } else {
                          ref.read(hoverProvider.notifier).state = "";
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Text("03. ",
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 13,
                                    fontFamily: 'sfmono')),
                            Consumer(builder: (context, ref, child) {
                              String state = ref.watch(hoverProvider);
                              bool isHovered = (state == "workTitle");

                              return Text("Work",
                                  style: TextStyle(
                                      color: isHovered
                                          ? AppColors().neonColor
                                          : AppColors().textColor,
                                      fontSize: 13,
                                      fontFamily: 'sfmono'));
                            }),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.controller.scrollToIndex(4,
                            preferPosition: AutoScrollPosition.begin);
                      },
                      onHover: (bol) {
                        if (bol) {
                          ref.read(hoverProvider.notifier).state =
                              "contactTitle";
                        } else {
                          ref.read(hoverProvider.notifier).state = "";
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          children: [
                            Text("04.",
                                style: TextStyle(
                                    color: AppColors().neonColor,
                                    fontSize: 13,
                                    fontFamily: 'sfmono')),
                            Consumer(builder: (context, ref, child) {
                              String state = ref.watch(hoverProvider);
                              bool isHovered = (state == "contactTitle");
                              return Text("Contact",
                                  style: TextStyle(
                                      color: isHovered
                                          ? AppColors().neonColor
                                          : AppColors().textColor,
                                      fontSize: 13));
                            }),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AppClass().downloadResume(context);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(
                                color: AppColors().neonColor, width: 1.5)),
                        child: Center(
                          child: Text('Resume',
                              style: TextStyle(
                                  color: AppColors().neonColor,
                                  fontSize: 13,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'sfmono')),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }());
  }
}
