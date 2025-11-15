import 'package:flutter/material.dart';

class NetflixLogo extends StatelessWidget {
  const NetflixLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/logo/netflixlogo.png'),
        ),
      ),
    );
  }
}
