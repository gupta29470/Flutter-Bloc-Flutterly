import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cubit/counter_cubit.dart';
import './screens/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: CounterScreen(),
      ),
    );
  }
}