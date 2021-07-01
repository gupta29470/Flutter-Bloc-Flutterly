part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool? wasIncremented; // true if "+" tapped, false if "-" tapped

  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  Map<String, dynamic> toMap() {
    return {
      "counterValue": counterValue,
      "wasIncremented": wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> data) {
    return CounterState(
      counterValue: data["counterValue"],
      wasIncremented: data["wasIncremented"],
    );
  }

  String toJSON() => json.encode(toMap());

  factory CounterState.fromJSON(String source) => CounterState.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return "Counter Value : $counterValue   Increment State : $wasIncremented";
  }

}
