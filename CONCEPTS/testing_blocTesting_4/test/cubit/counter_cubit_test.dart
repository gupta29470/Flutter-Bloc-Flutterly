import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_tutorial_1/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    // initialization
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('Initial state of CounterCubit is CounterState(counterValue:0)', () {
      expect(
        counterCubit.state, // actual
        CounterState(counterValue: 0), // expected
      );
    });

    blocTest(
      'the CounterCubit should emit a CounterState(counterValue:1, wasIncremented:true) when the increment function is called',
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'the CounterCubit should emit a CounterState(counterValue:-1, wasIncremented:false) when the decrement function is called',
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
