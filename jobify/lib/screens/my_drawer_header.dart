import 'package:flutter/material.dart';
import 'package:jobify/data/data.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(currentUser.imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(150.0),
            ),
          ),
          Text(
            currentUser.name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            currentUser.email,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
