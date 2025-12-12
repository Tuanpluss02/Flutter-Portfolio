import 'package:injectable/injectable.dart';

import '../../../../resource/app_resource.dart';
import '../models/portfolio_data_model.dart';

abstract class PortfolioLocalDataSource {
  Future<PortfolioDataModel> getPortfolioData();
}

@LazySingleton(as: PortfolioLocalDataSource)
class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<PortfolioDataModel> getPortfolioData() async {
    // In a real app, this might fetch from JSON or database.
    // Here we wrap static data into a model.
    return Future.value(
      PortfolioDataModel(
        socials: socialLinksList,
        technologies: technologiesList,
        experiences: experienceList,
        works: projectList,
      ),
    );
  }
}
