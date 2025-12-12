import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../../../../utils/screen_info.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/scroll_cubit.dart';
import '../widgets/about/about.dart';
import '../widgets/contact/contact.dart';
import '../widgets/experience/experience.dart';
import '../widgets/intro/intro.dart';
import '../widgets/common/app_bar.dart';
import '../widgets/common/left_pane.dart';
import '../widgets/common/right_pane.dart';
import '../widgets/work/work.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final aScrollController = AutoScrollController(keepScrollOffset: false);

  @override
  void initState() {
    super.initState();
    // Trigger loading data
    context.read<PortfolioBloc>().add(LoadPortfolioData());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              context.read<ScrollCubit>().setScrollDirection(isScrollingUp: false);
            } else if (direction == ScrollDirection.forward) {
              context.read<ScrollCubit>().setScrollDirection(isScrollingUp: true);
            }
            return true;
          },
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xff112240),
                  Color(0xff0a192f),
                  Color(0xff020c1b)
                ])),
            height: ScreenInfo().getMqHeight(context),
            child: Column(
              children: [
                BlocBuilder<ScrollCubit, bool>(
                  builder: (context, isScrollingUp) {
                    return AnimatedOpacity(
                      opacity: isScrollingUp ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: ActionBar(aScrollController),
                    );
                  },
                ),
                Expanded(
                  child: BlocBuilder<PortfolioBloc, PortfolioState>(
                    builder: (context, state) {
                      if (state is PortfolioLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is PortfolioError) {
                        return Center(child: Text(state.message));
                      } else if (state is PortfolioLoaded) {
                        ScreenType scrType = ScreenInfo().getScreenType(context);
                        return Row(
                          children: [
                            scrType == ScreenType.mobile
                                ? const SizedBox()
                                : const LeftPane(),
                            Expanded(
                                flex: 8,
                                child: WebSmoothScroll(
                                  controller: aScrollController,
                                  scrollOffset: 250,
                                  child: ListView(
                                    // physics: scrType == ScreenType.web
                                    //     ? const NeverScrollableScrollPhysics()
                                    //     : const BouncingScrollPhysics(),
                                    controller: aScrollController,
                                    children: [
                                      AutoScrollTag(
                                          key: const ValueKey(0),
                                          controller: aScrollController,
                                          index: 0,
                                          child: IntroContent(aScrollController)),
                                      AutoScrollTag(
                                          key: const ValueKey(1),
                                          controller: aScrollController,
                                          index: 1,
                                          child: const About()),
                                      AutoScrollTag(
                                          key: const ValueKey(2),
                                          controller: aScrollController,
                                          index: 2,
                                          child: const Experience()),
                                      AutoScrollTag(
                                          key: const ValueKey(3),
                                          controller: aScrollController,
                                          index: 3,
                                          child: const Work()),
                                      AutoScrollTag(
                                          key: const ValueKey(4),
                                          controller: aScrollController,
                                          index: 4,
                                          child: const Contact())
                                    ],
                                  ),
                                )),
                            scrType == ScreenType.mobile
                                ? const SizedBox()
                                : const RightPane(),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
