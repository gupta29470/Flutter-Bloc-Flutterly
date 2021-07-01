import 'package:bloc_tutorial_1/logic/cubit/counter_cubit.dart';
import 'package:bloc_tutorial_1/presentation/screens/counter_screen_1.dart';
import 'package:bloc_tutorial_1/presentation/screens/counter_screen_2.dart';
import 'package:bloc_tutorial_1/presentation/screens/counter_screen_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  CounterCubit _counterCubit = CounterCubit();

  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: CounterScreen1(),
          ),
        );

      case "screen_2":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: CounterScreen2(),
          ),
        );
      case "screen_3":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: CounterScreen3(),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
