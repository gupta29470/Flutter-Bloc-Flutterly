import 'package:bloc_tutorial_1/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen2 extends StatefulWidget {
  const CounterScreen2({Key? key}) : super(key: key);

  @override
  _CounterScreenState2 createState() => _CounterScreenState2();
}

class _CounterScreenState2 extends State<CounterScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter Screen 2",
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Tap + or -",
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Divider(),
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
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state.wasIncremented == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Incremented"),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Decremented"),
                          duration: Duration(milliseconds: 300),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
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
            SizedBox(height: 80),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              height: 70,
              onPressed: () {
                // anonymous route
                Navigator.of(context).pushNamed("screen_3");
              },
              child: Text(
                "Counter screen 3",
                style: Theme.of(context).textTheme.headline4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
