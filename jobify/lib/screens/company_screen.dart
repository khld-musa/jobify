import 'package:flutter/material.dart';
import 'package:jobify/models/job.dart';
import 'package:jobify/models/company.dart';



class CompanyScreen extends StatefulWidget {
  final Company company;

  CompanyScreen({required this.company});

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  _buildMenuItem(Job menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: <Widget>[
                Text(
                  menuItem.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.company.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.company.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: Theme.of(context).primaryColor,
                      iconSize: 35.0,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.company.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.company.address,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextButton(
                  
                  // Theme.of(context).primaryColor,
                //  RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextButton(
                  // padding: EdgeInsets.symmetric(horizontal: 30.0),
                  // color: Theme.of(context).primaryColor,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.company.jobs.length, (index) {
                Job food = widget.company.jobs[index];
                return _buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
