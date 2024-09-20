import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Future<bool> isConnected() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  // Optionally: Stream to listen for connectivity changes
  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;
}
