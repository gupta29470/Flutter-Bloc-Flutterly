import 'package:bloc_tutorial_1/logic/cubit/counter_cubit.dart';
import 'package:bloc_tutorial_1/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/internet_cubit.dart';

void main() {
  runApp(
    MyApp(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    required this.appRouter,
    required this.connectivity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            internetCubit: BlocProvider.of<InternetCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        onGenerateRoute: appRouter.onGeneratedRoute,
      ),
    );
  }
}
