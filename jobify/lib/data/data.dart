// Food
import 'package:jobify/models/job.dart';
import 'package:jobify/models/order.dart';
import 'package:jobify/models/company.dart';
import 'package:jobify/models/user.dart';

final _burrito =
    Job(imageUrl: 'assets/images/burrito.jpg', name: 'Burrito', price: 8.99);
final _steak =
    Job(imageUrl: 'assets/images/steak.jpg', name: 'Steak', price: 17.99);
final _pasta =
    Job(imageUrl: 'assets/images/pasta.jpg', name: 'Pasta', price: 14.99);
final _ramen =
    Job(imageUrl: 'assets/images/ramen.jpg', name: 'Ramen', price: 13.99);
final _pancakes =
    Job(imageUrl: 'assets/images/pancakes.jpg', name: 'Pancakes', price: 9.99);
final _burger =
    Job(imageUrl: 'assets/images/burger.jpg', name: 'Burger', price: 14.99);
final _pizza =
    Job(imageUrl: 'assets/images/pizza.jpg', name: 'Pizza', price: 11.99);
final _salmon = Job(
    imageUrl: 'assets/images/salmon.jpg', name: 'Salmon Salad', price: 12.99);

// Restaurants
final _company0 = Company(
  imageUrl: 'assets/images/restaurant0.jpg',
  name: 'Restaurant 0',
  address: 'khartoum, sudan',
job: _steak.name,
  jobs: [_burrito, _steak, _pasta, _ramen, _pancakes, _burger, _pizza, _salmon],
);
final _company1 = Company(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'Restaurant 1',
  address: 'khartoum, sudan',
job: _pancakes.name,
  jobs: [_steak, _pasta, _ramen, _pancakes, _burger, _pizza],
);
final _company2 = Company(
  imageUrl: 'assets/images/restaurant2.jpg',
  name: 'Restaurant 2',
  address: 'khartoum, sudan',
job: _ramen.name,
  jobs: [_steak, _pasta, _pancakes, _burger, _pizza, _salmon],
);
final _company3 = Company(
  imageUrl: 'assets/images/restaurant3.jpg',
  name: 'Restaurant 3',
  address: 'khartoum, sudan',
job: _pizza.name,
  jobs: [_burrito, _steak, _burger, _pizza, _salmon],
);
final _company4 = Company(
  imageUrl: 'assets/images/restaurant4.jpg',
  name: 'Restaurant 4',
  address: 'khartoum, sudan',
  job: _burger.name,
  jobs: [_burrito, _ramen, _pancakes, _salmon],
);

final List<Company> companies = [
  _company0,
  _company1,
  _company2,
  _company3,
  _company4,
];

// User
final currentUser = User(
  name: 'khalid',
  orders: [
    Order(
      date: 'Jan 10, 2023',
      food: _steak,
      company: _company2,
      quantity: 1,
    ),
    Order(
      date: 'Jan 8, 2023',
      food: _ramen,
      company: _company0,
      quantity: 3,
    ),
    Order(
      date: 'Jan 5, 2023',
      food: _burrito,
      company: _company1,
      quantity: 2,
    ),
    Order(
      date: 'Jan 2, 2023',
      food: _salmon,
      company: _company3,
      quantity: 1,
    ),
    Order(
      date: 'Jan 1, 2023',
      food: _pancakes,
      company: _company4,
      quantity: 1,
    ),
  ],
  cart: [
    Order(
      date: 'Jan 11, 2023',
      food: _burger,
      company: _company2,
      quantity: 2,
    ),
    Order(
      date: 'Jan 11, 2023',
      food: _pasta,
      company: _company2,
      quantity: 1,
    ),
    Order(
      date: 'Jan 11, 2023',
      food: _salmon,
      company: _company3,
      quantity: 1,
    ),
    Order(
      date: 'Jan 11, 2023',
      food: _pancakes,
      company: _company4,
      quantity: 3,
    ),
    Order(
      date: 'Jan 11, 2023',
      food: _burrito,
      company: _company1,
      quantity: 2,
    ),
  ],
  about:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
  email: 'khalidmusa249@gmail.com',
  imagePath: 'assets/images/restaurant4.jpg',
);
