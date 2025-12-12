// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/portfolio/data/datasources/portfolio_local_data_source.dart'
    as _i832;
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart'
    as _i228;
import 'features/portfolio/domain/repositories/portfolio_repository.dart'
    as _i166;
import 'features/portfolio/domain/usecases/get_portfolio_data.dart' as _i1007;
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart' as _i788;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i832.PortfolioLocalDataSource>(
      () => _i832.PortfolioLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i166.PortfolioRepository>(
      () => _i228.PortfolioRepositoryImpl(gh<_i832.PortfolioLocalDataSource>()),
    );
    gh.lazySingleton<_i1007.GetPortfolioData>(
      () => _i1007.GetPortfolioData(gh<_i166.PortfolioRepository>()),
    );
    gh.factory<_i788.PortfolioBloc>(
      () => _i788.PortfolioBloc(gh<_i1007.GetPortfolioData>()),
    );
    return this;
  }
}
