import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/portfolio_data_model.dart';

abstract class PortfolioRepository {
  Future<Either<Failure, PortfolioDataModel>> getPortfolioData();
}
