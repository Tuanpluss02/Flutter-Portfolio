// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/general_controller.dart';
import '../../resource/app_messages.dart';
import '../../resource/colors.dart';

class WorkMobile extends ConsumerStatefulWidget {
  const WorkMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkMobile> createState() => _WorkWebState();
}

class _WorkWebState extends ConsumerState<WorkMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: "03.",
              style: TextStyle(
                  color: AppColors().neonColor,
                  fontSize: 20,
                  fontFamily: 'sfmono'),
              children: <TextSpan>[
                TextSpan(
                  text: ' My Noteworthy Projects',
                  style: GoogleFonts.roboto(
                      color: AppColors().textColor,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'view the archives',
            style: TextStyle(
                color: AppColors().neonColor,
                fontSize: 12,
                fontFamily: 'sfmono'),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              ...List.generate(
                projectList.length,
                (index) => StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: projectWidget(index: index),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  projectWidget({required int index}) {
    return InkWell(
      onTap: () async {
        await launchUrl(Uri.parse(projectList[index].link!));
      },
      onHover: (bol) {
        if (bol) {
          ref.read(hoverProvider.notifier).state = "$index";
        } else {
          ref.read(hoverProvider.notifier).state = "";
        }
      },
      child: Consumer(builder: (context, ref, child) {
        String data = ref.watch(hoverProvider);
        bool isHovered = (data == "$index");
        return Container(
          margin: EdgeInsets.all(isHovered ? 8.0 : 0.0),
          child: Card(
            color: AppColors().cardColor,
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/folder.svg',
                        width: 35,
                        height: 35,
                        color: AppColors().neonColor,
                      ),
                      SvgPicture.asset(
                        'assets/svg/externalLink.svg',
                        width: 20,
                        height: 20,
                        color: isHovered ? AppColors().neonColor : Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            projectList[index].projectTitle.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.robotoSlab(
                              color: isHovered
                                  ? AppColors().neonColor
                                  : Colors.white,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: AutoSizeText(
                        projectList[index].projectContent.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        projectList[index].tech1.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          fontSize: 10,
                        ),
                      ),
                      AutoSizeText(
                        projectList[index].tech2.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          fontSize: 10,
                        ),
                      ),
                      AutoSizeText(
                        projectList[index].tech3.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
