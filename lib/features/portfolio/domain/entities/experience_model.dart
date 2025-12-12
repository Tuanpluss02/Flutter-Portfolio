/// Experience entity
class ExperienceModel {
  final String company;
  final String position;
  final String duration;
  final String website;
  final List<String> jobs;

  const ExperienceModel({
    required this.company,
    required this.position,
    required this.duration,
    required this.website,
    required this.jobs,
  });
}
