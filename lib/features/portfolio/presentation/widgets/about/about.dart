import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/resource/app_assets.dart';
import 'package:portfolio/utils/screen_info.dart';

import '../../../../../resource/app_colors.dart';
import '../../../../../resource/app_resource.dart';
import '../../bloc/hover_cubit.dart';
import '../../bloc/portfolio_bloc.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                    text: "01.",
                    style: TextStyle(
                        color: AppColors().neonColor,
                        fontSize: 20,
                        fontFamily: 'CircularStd'),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ' About Me',
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
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...aboutScreenContentsList.map((content) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          content,
                          style: TextStyle(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: ScreenInfo().getScreenType(context) ==
                                    ScreenType.mobile
                                ? 15
                                : 18,
                          ),
                        ),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: BlocBuilder<PortfolioBloc, PortfolioState>(
                        builder: (context, state) {
                          if (state is! PortfolioLoaded) return const SizedBox();
                          return GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              childAspectRatio: 6,
                              children: state.data.technologies
                                  .map(
                                    (item) => Container(
                                      margin: const EdgeInsets.all(2),
                                      padding: const EdgeInsets.all(2),
                                      child: Image.asset(
                                        fit: BoxFit.scaleDown,
                                        item.techLogo,
                                        // width: 50,
                                        // height: 30,
                                      ),
                                    ),
                                  )
                                  .toList());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ScreenInfo().getScreenType(context) == ScreenType.web
                  ? Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          BlocBuilder<HoverCubit, String>(
                            builder: (context, data) {
                              bool isHovered = (data == "profilePic");
                              return Stack(
                                children: [
                                  AnimatedContainer(
                                    width: ScreenInfo().getMqWidth(context) *
                                        (isHovered ? 0.22 : 0.225),
                                    height: ScreenInfo().getMqWidth(context) *
                                        (isHovered ? 0.22 : 0.225),
                                    margin:
                                        const EdgeInsets.only(top: 10, left: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        border: Border.all(
                                            color: AppColors().neonColor,
                                            width: 1.5)),
                                    duration: const Duration(milliseconds: 300),
                                    // Provide an optional curve to make the animation feel smoother.
                                    curve: Curves.fastOutSlowIn,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    onHover: (bol) {
                                      if (bol) {
                                        context.read<HoverCubit>().setHover("profilePic");
                                      } else {
                                        context.read<HoverCubit>().setHover("");
                                      }
                                    },
                                    child: Container(
                                      width:
                                          ScreenInfo().getMqWidth(context) * 0.22,
                                      height:
                                          ScreenInfo().getMqWidth(context) * 0.22,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage(AppAssets.avatar)),
                                          color: Colors.transparent),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ))
                  : Container()
            ],
          )
        ],
      ),
    );
  }
}
