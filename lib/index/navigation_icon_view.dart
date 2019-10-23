import 'package:flutter/material.dart';

class NavigationIconView {
  NavigationIconView({Widget icon, Widget title, TickerProvider vsync})
      : item = new BottomNavigationBarItem(icon: icon, title: title),
        controller = new AnimationController(
            vsync: vsync, duration: kThemeAnimationDuration);

  final BottomNavigationBarItem item;
  final AnimationController controller;
}
