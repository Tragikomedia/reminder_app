import 'package:flutter/material.dart';

class RouteHandler {
  static  Route createRoute(Widget screen) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
                Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.bounceIn))),
            child: child,);
        });
  }
}