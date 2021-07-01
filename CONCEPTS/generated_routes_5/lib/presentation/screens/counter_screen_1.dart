import 'package:bloc_tutorial_1/logic/cubit/counter_cubit.dart';
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
                  heroTag: "btn1",
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
                  heroTag: "btn2",
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
