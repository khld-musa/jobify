import 'package:jobify/models/order.dart';

class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final List<Order> orders;
  final List<Order> cart;

  User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.orders,
    required this.cart,
  });
}
