import 'package:injectable/injectable.dart';
import '../../../../resource/app_resource.dart';
import '../models/portfolio_data_model.dart';
import '../../domain/entities/experience_model.dart';
import '../../domain/entities/social_model.dart';
import '../../domain/entities/technology_model.dart';
import '../../domain/entities/work_model.dart';

abstract class PortfolioLocalDataSource {
  Future<PortfolioDataModel> getPortfolioData();
}

@LazySingleton(as: PortfolioLocalDataSource)
class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<PortfolioDataModel> getPortfolioData() async {
    // In a real app, this might fetch from JSON or database.
    // Here we wrap static data into a model.
    return Future.value(PortfolioDataModel(
      socials: AppResource.socialList,
      technologies: AppResource.techList,
      experiences: AppResource.experienceList,
      works: AppResource.workList,
    ));
  }
}
