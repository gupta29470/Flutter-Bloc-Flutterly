import 'package:bloc_tutorial_1/constants/enums.dart';
import 'package:bloc_tutorial_1/logic/cubit/counter_cubit.dart';
import 'package:bloc_tutorial_1/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen1 extends StatefulWidget {
  const CounterScreen1({Key? key}) : super(key: key);

  @override
  _CounterScreenState1 createState() => _CounterScreenState1();
}

class _CounterScreenState1 extends State<CounterScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter Screen 1",
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  heroTag: "btn4",
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Builder(
                  builder: (context) {
                    final counterState = context.watch<CounterCubit>().state;
                    final internetState = context.watch<InternetCubit>().state;
                    return Column(
                      children: <Widget>[
                        if (internetState is InternetConnectedState &&
                            internetState.connectionType == ConnectionType.WiFi)
                          Text(
                            "WiFi    ${counterState.counterValue}",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          )
                        else if (internetState is InternetConnectedState &&
                            internetState.connectionType ==
                                ConnectionType.Mobile)
                          Text(
                            "Mobile    ${counterState.counterValue}",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          )
                        else if (internetState is InternetDisconnectedState)
                          Text(
                            "Disconnected    ${counterState.counterValue}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          )
                      ],
                    );
                  },
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  heroTag: "btn3",
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Builder(
              builder: (context) {
                final counterValue = context.select(
                    (CounterCubit counterCubit) =>
                        counterCubit.state.counterValue);
                return Text(
                  "$counterValue",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              height: 70,
              onPressed: () {
                // anonymous route
                Navigator.of(context).pushNamed("screen_2");
              },
              child: Text(
                "Counter screen 2",
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
