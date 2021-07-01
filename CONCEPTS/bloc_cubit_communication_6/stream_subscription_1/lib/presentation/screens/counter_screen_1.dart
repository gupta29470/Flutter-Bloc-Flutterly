import 'package:bloc_tutorial_1/constants/enums.dart';
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
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnectedState &&
                    state.connectionType == ConnectionType.WiFi) {
                  return Text(
                    "WiFi",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  );
                } else if (state is InternetConnectedState &&
                    state.connectionType == ConnectionType.WiFi) {
                  return Text(
                    "Mobile",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  );
                } else if (state is InternetDisconnectedState) {
                  return Text(
                    "Disconnected",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'BRR, NEGATIVE ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'YAAAY ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'HMM, NUMBER 5',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                },
              ),
            SizedBox(height: 60),
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
