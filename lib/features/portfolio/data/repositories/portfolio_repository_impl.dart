import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../datasources/portfolio_local_data_source.dart';
import '../models/portfolio_data_model.dart';
import '../../domain/repositories/portfolio_repository.dart';

@LazySingleton(as: PortfolioRepository)
class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, PortfolioDataModel>> getPortfolioData() async {
    try {
      final data = await localDataSource.getPortfolioData();
      return Right(data);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
