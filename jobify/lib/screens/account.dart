import 'package:flutter/material.dart';
import 'package:jobify/data/data.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Builder(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
            ),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 50.0),
                  child: Container(
                    height: 270.0,
                    width: 170.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(currentUser.imagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(150.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildName(),
                const SizedBox(height: 48),
                _buildAbout()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName() => Column(
        children: [
          Text(
            currentUser.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            currentUser.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget _buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              currentUser.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  icon(IconData menu) {}
}
