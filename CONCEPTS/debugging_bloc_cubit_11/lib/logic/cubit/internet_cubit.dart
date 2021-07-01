import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial_1/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoadingState()) {
    _monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> _monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi) {
          emitConnectedState(ConnectionType.WiFi);
        } else if (connectivityResult == ConnectivityResult.mobile) {
          emitConnectedState(ConnectionType.Mobile);
        } else if (connectivityResult == ConnectivityResult.none) {
          emitDisconnectedState();
        }
      },
    );
  }

  void emitConnectedState(ConnectionType _connectionType) =>
      emit(InternetConnectedState(connectionType: _connectionType));

  void emitDisconnectedState() => emit(InternetDisconnectedState());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
