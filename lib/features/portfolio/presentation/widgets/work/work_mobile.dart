// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../resource/app_assets.dart';
import '../../../../../resource/app_colors.dart';
import '../../bloc/hover_cubit.dart';
import '../../bloc/portfolio_bloc.dart';
import '../../../domain/entities/work_model.dart';

class WorkMobile extends StatefulWidget {
  const WorkMobile({super.key});

  @override
  State<WorkMobile> createState() => _WorkMobileState();
}

class _WorkMobileState extends State<WorkMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: "03.",
              style: TextStyle(
                  color: AppColors.neonColor,
                  fontSize: 20,
                  fontFamily: 'CircularStd'),
              children: <TextSpan>[
                TextSpan(
                  text: ' My Noteworthy Projects',
                  style: TextStyle(
                      color: AppColors.textColor,
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
                color: AppColors.neonColor,
                fontSize: 12,
                fontFamily: 'CircularStd'),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
          child: BlocBuilder<PortfolioBloc, PortfolioState>(
            builder: (context, state) {
              if (state is! PortfolioLoaded) return const SizedBox();
              final works = state.data.works;

              return StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  ...List.generate(
                    works.length,
                    (index) => StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: projectWidget(index: index, work: works[index]),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  InkWell projectWidget({required int index, required WorkModel work}) {
    return InkWell(
      onTap: () async {
        await launchUrl(Uri.parse(work.link));
      },
      onHover: (bol) {
        if (bol) {
          context.read<HoverCubit>().setHover("$index");
        } else {
          context.read<HoverCubit>().setHover("");
        }
      },
      child: BlocBuilder<HoverCubit, String>(
        builder: (context, data) {
          bool isHovered = (data == "$index");
          return Container(
            margin: EdgeInsets.all(isHovered ? 8.0 : 0.0),
            child: Card(
              color: AppColors.cardColor,
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
                          AppAssets.folderLogo,
                          width: 35,
                          height: 35,
                          color: AppColors.neonColor,
                        ),
                        SvgPicture.asset(
                          AppAssets.externalLink,
                          width: 20,
                          height: 20,
                          color: isHovered ? AppColors.neonColor : Colors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              work.projectTitle.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: isHovered
                                    ? AppColors.neonColor
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
                          work.projectContent.toString(),
                          style: TextStyle(
                            color: AppColors.textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        children: work.techs.map((tech) {
                           return Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.cardColor,
                              ),
                              child: Center(
                                child: Image.asset(tech.techLogo, width: 20, height: 20,),
                              ),
                            );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
