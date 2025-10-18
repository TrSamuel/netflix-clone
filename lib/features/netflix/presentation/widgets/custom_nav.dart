import 'package:flutter/material.dart';

class CustomNav extends PageRouteBuilder {
  final Widget page;
  CustomNav({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 10),
          reverseTransitionDuration: const Duration(milliseconds: 10),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(begin: Offset(1,0), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeInOut));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
