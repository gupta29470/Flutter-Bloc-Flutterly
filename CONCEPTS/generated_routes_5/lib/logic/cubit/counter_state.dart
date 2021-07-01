part of 'counter_cubit.dart';

class CounterState extends Equatable{
  int counterValue;
  bool? wasIncremented; // true if "+" tapped, false if "-" tapped

  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [this.counterValue, this.wasIncremented];
}
