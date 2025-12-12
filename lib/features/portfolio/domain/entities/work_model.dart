import 'technology_model.dart';

/// Work/Project entity
class WorkModel {
  final String projectTitle;
  final String projectContent;
  final List<Technology> techs;
  final String link;

  const WorkModel({
    required this.projectTitle,
    required this.projectContent,
    required this.techs,
    required this.link,
  });
}
