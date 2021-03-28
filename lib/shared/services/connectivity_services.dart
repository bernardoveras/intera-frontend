import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ConnectivityService {
  late Connectivity connectivity;

  final RxBool _connectController = true.obs;

  bool get isConnected => _connectController.value!;

  set isConnected(bool value) => _connectController.value = value;

  Stream<bool?> get connectStream => _connectController.stream;

  late StreamSubscription _subscriptionConnect;

  ConnectivityService() {
    connectivity = Connectivity();
    _checkInternet();
    initialiseTestInterGeral();
  }

  Future<void> initialiseTestInterGeral() async {
    _subscriptionConnect = connectivity.onConnectivityChanged.listen((result) {
      _checkInternet();
    });
  }

  Future<void> _checkInternet() async {
    bool isOnline = false;
    final result = await connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) {
      isOnline = false;
    } else if (result == ConnectivityResult.mobile) {
      isOnline = true;
    } else if (result == ConnectivityResult.wifi) {
      isOnline = true;
    }
    isConnected = isOnline;
  }

  FutureOr<void> onClose() async {
    _connectController.close();
    _subscriptionConnect.cancel();
  }
}
