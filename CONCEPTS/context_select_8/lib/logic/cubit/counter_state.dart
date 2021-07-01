part of 'counter_cubit.dart';

class CounterState{
  int counterValue;
  bool? wasIncremented; // true if "+" tapped, false if "-" tapped

  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });
}
