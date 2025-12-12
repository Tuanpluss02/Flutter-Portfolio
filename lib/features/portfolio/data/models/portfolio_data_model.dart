import '../../domain/entities/experience_model.dart';
import '../../domain/entities/social_model.dart';
import '../../domain/entities/technology_model.dart';
import '../../domain/entities/work_model.dart';

class PortfolioDataModel {
  final List<Social> socials;
  final List<Technology> technologies;
  final List<ExperienceModel> experiences;
  final List<WorkModel> works;

  PortfolioDataModel({
    required this.socials,
    required this.technologies,
    required this.experiences,
    required this.works,
  });
}
