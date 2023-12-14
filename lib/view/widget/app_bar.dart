import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../controller/general_controller.dart';
import '../../resource/appbar_items.dart';
import '../../resource/colors.dart';
import '../../utils/screen_info.dart';

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
          ScreenType scrType = ScreenInfo().getScreenType(context);
          if (scrType == ScreenType.mobile) {
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
                        itemBuilder: (context) => appBarItems
                            .map(
                              (item) => PopupMenuItem(
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
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              item.title,
                                              style: GoogleFonts.roboto(),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            )
                            .toList(),
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
                  children: appBarItems
                      .map(
                        (item) => InkWell(
                          onTap: () => widget.controller.scrollToIndex(
                              item.index,
                              preferPosition: AutoScrollPosition.begin),
                          onHover: (bol) {
                            if (bol) {
                              ref.read(hoverProvider.notifier).state =
                                  item.riverpodKey;
                            } else {
                              ref.read(hoverProvider.notifier).state = "";
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Row(
                              children: [
                                Text(
                                  "${item.index.toString().padLeft(2, '0')}. ",
                                  style: TextStyle(
                                      color: AppColors().neonColor,
                                      fontSize: 13,
                                      fontFamily: 'sfmono'),
                                ),
                                Consumer(builder: (context, ref, child) {
                                  String state = ref.watch(hoverProvider);
                                  bool isHovered = (state == item.riverpodKey);
                                  return Text(
                                    item.title,
                                    style: TextStyle(
                                        color: isHovered
                                            ? AppColors().neonColor
                                            : AppColors().textColor,
                                        fontSize: 13,
                                        fontFamily: 'sfmono'),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        }());
  }
}
