import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'features/portfolio/presentation/bloc/scroll_cubit.dart';
import 'features/portfolio/presentation/bloc/hover_cubit.dart';
import 'features/portfolio/presentation/pages/root_screen.dart';
import 'injection.dart';
import 'resource/app_colors.dart';

void main() {
  setPathUrlStrategy();
  configureDependencies();
  runApp(const AppTheme());
}

class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<PortfolioBloc>()),
        BlocProvider(create: (_) => ScrollCubit()),
        BlocProvider(create: (_) => HoverCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tuan Do\'s Portfolio',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors().primaryColor,
          fontFamily: 'CircularStd',
        ),
        home: const RootScreen(),
      ),
    );
  }
}
