import 'package:bloc_tutorial_1/presentation/screens/counter_screen_1.dart';
import 'package:bloc_tutorial_1/presentation/screens/counter_screen_2.dart';
import 'package:bloc_tutorial_1/presentation/screens/counter_screen_3.dart';
import 'package:bloc_tutorial_1/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => CounterScreen1(),
        );

      case "screen_2":
        return MaterialPageRoute(
          builder: (_) => CounterScreen2(),
        );
      case "screen_3":
        return MaterialPageRoute(
          builder: (_) => CounterScreen3(),
        );

      case "settings":
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );

      default:
        return null;
    }
  }
}
