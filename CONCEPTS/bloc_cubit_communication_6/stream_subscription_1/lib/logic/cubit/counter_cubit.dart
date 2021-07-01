import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial_1/constants/enums.dart';

import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    _monitorInternetCubit();
  }

  StreamSubscription<InternetState> _monitorInternetCubit() {
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnectedState &&
          internetState.connectionType == ConnectionType.WiFi) {
        increment();
      } else if (internetState is InternetConnectedState &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
