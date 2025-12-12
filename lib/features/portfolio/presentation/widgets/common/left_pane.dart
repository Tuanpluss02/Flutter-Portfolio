// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../resource/app_colors.dart';
import '../../../../../utils/screen_info.dart';
import '../../bloc/hover_cubit.dart';
import '../../bloc/portfolio_bloc.dart';

class LeftPane extends StatelessWidget {
  const LeftPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: BlocBuilder<PortfolioBloc, PortfolioState>(
                  builder: (context, portfolioState) {
                    if (portfolioState is! PortfolioLoaded) {
                      return const SizedBox();
                    }
                    return BlocBuilder<HoverCubit, String>(
                      builder: (context, val) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: portfolioState.data.socials
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
                                            context.read<HoverCubit>().setHover(item.state);
                                          } else {
                                            context.read<HoverCubit>().setHover("");
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
                      },
                    );
                  },
                )),
            Expanded(
                child: Container(
              width: 1,
              color: AppColors().textColor,
            ))
          ],
        ));
  }
}
