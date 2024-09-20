import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connectivity_event.dart';
import 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    // Listen to connectivity changes
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      // Determine if there is an internet connection
      bool isConnected = result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi);
      // Add the ConnectivityChanged event
      add(ConnectivityChanged(isConnected));
    });

    // Handle the ConnectivityChanged event
    on<ConnectivityChanged>((event, emit) {
      if (event.isConnected) {
        emit(ConnectivitySuccess(event.isConnected));
      } else {
        emit(ConnectivityFailure());
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
