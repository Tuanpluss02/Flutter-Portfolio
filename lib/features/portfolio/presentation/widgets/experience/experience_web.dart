import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../resource/app_colors.dart';
import '../../../../../utils/screen_info.dart';
import '../../bloc/portfolio_bloc.dart';

class ExperienceWeb extends StatefulWidget {
  const ExperienceWeb({Key? key}) : super(key: key);

  @override
  State<ExperienceWeb> createState() => _ExperienceWebState();
}

class _ExperienceWebState extends State<ExperienceWeb> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenInfo().getMqHeight(context) - 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: "02.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'CircularStd'),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ''' Where I've Worked''',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              ),
              Container(
                height: 0.5,
                margin: const EdgeInsets.only(left: 15),
                width: ScreenInfo().getMqWidth(context) * 0.2,
                color: AppColors().textLight,
              )
            ],
          ),
          BlocBuilder<PortfolioBloc, PortfolioState>(
            builder: (context, state) {
              if (state is! PortfolioLoaded) return const SizedBox();
              final experiences = state.data.experiences;
              final selectedIndex = state.selectedExperienceIndex;

              return Container(
                width: ScreenInfo().getMqWidth(context) * 0.6,
                margin: const EdgeInsets.only(top: 30.0, left: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(
                              experiences.length,
                              (index) => selectCompany(context, selectedIndex, index, experiences[index].company!),
                            ),
                          ]),
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => launchUrl(
                                Uri.parse(experiences[selectedIndex].website!)),
                            child: RichText(
                              text: TextSpan(
                                  text: experiences[selectedIndex].position,
                                  style: TextStyle(
                                      color: AppColors().textColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' @${experiences[selectedIndex].company}',
                                      style: TextStyle(
                                          color: AppColors().neonColor,
                                          fontSize: 20),
                                    )
                                  ]),
                            ),
                          ),
                          Text(
                            experiences[selectedIndex].duration.toString(),
                            style: TextStyle(
                                color: AppColors().textLight,
                                letterSpacing: 1,
                                height: 1.5,
                                fontSize: 14,
                                fontFamily: 'CircularStd'),
                          ),
                          expWidget(experiences[selectedIndex].jobs!)
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget selectCompany(BuildContext context, int selectedIndex, int index, String companyName) {
    return InkWell(
      onTap: () {
        context.read<PortfolioBloc>().add(ChangeSelectedExperience(index));
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: index == selectedIndex
                ? AppColors().cardColor
                : Colors.transparent,
            border: Border(
                left: BorderSide(
                    color: index == selectedIndex
                        ? AppColors().neonColor
                        : Colors.white,
                    width: 2))),
        child: Text(
          companyName,
          style: TextStyle(
              color: index == selectedIndex
                  ? AppColors().neonColor
                  : AppColors().textLight,
              letterSpacing: 1,
              height: 1.5,
              fontSize: 14,
              fontFamily: 'CircularStd'),
        ),
      ),
    );
  }

  Widget expWidget(List<String> jobs) {
    return Column(
      children: [
        ...List.generate(
          jobs.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.arrow_right,
                          color: AppColors().neonColor,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: ScreenInfo().getMqWidth(context) * 0.35,
                        child: Text(
                          jobs[index],
                          style: TextStyle(
                              color: AppColors().textLight,
                              letterSpacing: 1,
                              height: 1.5,
                              fontSize: 14,
                              fontFamily: 'CircularStd'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
