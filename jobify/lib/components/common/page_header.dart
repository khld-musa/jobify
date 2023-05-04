import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 300,
      height: size.height * 0.3,
      child: Image.asset('assets/images/R.png'),
    );
  }
}
