

import 'package:jobify/models/job.dart';
import 'package:jobify/models/company.dart';


class Order {
  final Company company;
  final Job food;
  final String date;
  final int quantity;

  Order({
    required this.date,
    required this.company,
    required this.food,
    required this.quantity,
  });
}
