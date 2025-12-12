import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/portfolio_data_model.dart';
import '../repositories/portfolio_repository.dart';

@lazySingleton
class GetPortfolioData implements UseCase<PortfolioDataModel, NoParams> {
  final PortfolioRepository repository;

  GetPortfolioData(this.repository);

  @override
  Future<Either<Failure, PortfolioDataModel>> call(NoParams params) async {
    return await repository.getPortfolioData();
  }
}
