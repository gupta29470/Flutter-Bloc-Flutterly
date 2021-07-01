import 'dart:async';

import 'package:bloc_tutorial_1/logic/cubit/counter_cubit.dart';
import 'package:bloc_tutorial_1/logic/cubit/setting_cubit.dart';
import 'package:bloc_tutorial_1/presentation/router/app_router.dart';
import 'package:bloc_tutorial_1/utility/app_bloc_observer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/internet_cubit.dart';

Future<void> main() async {
  // if calling native code this is required
  WidgetsFlutterBinding.ensureInitialized();

  // this will call native node
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();

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
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingCubit>(
          create: (context) => SettingCubit(),
          lazy: false,
        )
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
