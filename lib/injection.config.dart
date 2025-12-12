// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/portfolio/data/datasources/portfolio_local_data_source.dart'
    as _i3;
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart'
    as _i5;
import 'features/portfolio/domain/repositories/portfolio_repository.dart'
    as _i4;
import 'features/portfolio/domain/usecases/get_portfolio_data.dart' as _i6;
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.PortfolioLocalDataSource>(
        () => _i3.PortfolioLocalDataSourceImpl());
    gh.lazySingleton<_i4.PortfolioRepository>(
        () => _i5.PortfolioRepositoryImpl(gh<_i3.PortfolioLocalDataSource>()));
    gh.lazySingleton<_i6.GetPortfolioData>(
        () => _i6.GetPortfolioData(gh<_i4.PortfolioRepository>()));
    gh.factory<_i7.PortfolioBloc>(
        () => _i7.PortfolioBloc(gh<_i6.GetPortfolioData>()));
    return this;
  }
}
