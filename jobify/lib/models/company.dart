import 'package:jobify/models/job.dart';

class Company {
  final String imageUrl;
  final String name;
  final String address;
  final String job;
  final List<Job> jobs;

  Company({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.jobs,
    required this.job,
  });
}
