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

class WorkWeb extends StatefulWidget {
  const WorkWeb({super.key});

  @override
  State<WorkWeb> createState() => _WorkWebState();
}

class _WorkWebState extends State<WorkWeb> {
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
                  fontFamily: 'CircularStd'),
              children: <TextSpan>[
                TextSpan(
                  text: ' My Noteworthy Projects',
                  style: TextStyle(
                      color: AppColors().textColor,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'view the archives',
            style: TextStyle(
                color: AppColors().neonColor,
                fontSize: 15,
                fontFamily: 'CircularStd'),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30.0, bottom: 70.0),
          child: BlocBuilder<PortfolioBloc, PortfolioState>(
            builder: (context, state) {
              if (state is! PortfolioLoaded) return const SizedBox();
              final works = state.data.works;

              return StaggeredGrid.count(
                crossAxisCount: 3,
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

  // ignore: non_constant_identifier_names
  InkWell projectWidget({required int index, required WorkModel work}) {
    return InkWell(
      onTap: () async {
        await launchUrl(Uri.parse(work.link!));
      },
      onHover: (val) {
        if (val) {
          context.read<HoverCubit>().setHover("$index");
        } else {
          context.read<HoverCubit>().setHover("");
        }
      },
      child: BlocBuilder<HoverCubit, String>(
        builder: (context, data) {
          bool isHovered = (data == "$index");
          return AnimatedContainer(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            margin: EdgeInsets.all(isHovered ? 8.0 : 0.0),
            child: Card(
              color: AppColors().cardColor,
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AppAssets.folderLogo,
                          width: 45,
                          height: 45,
                          color: AppColors().neonColor,
                        ),
                        SvgPicture.asset(
                          AppAssets.externalLink,
                          width: 22,
                          height: 22,
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
                              work.projectTitle.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: isHovered
                                      ? AppColors().neonColor
                                      : Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          work.projectContent.toString(),
                          style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          children: work.techs!
                              .map((item) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      item.techLogo,
                                      width: 50,
                                      height: 30,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ))
                              .toList()),
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
