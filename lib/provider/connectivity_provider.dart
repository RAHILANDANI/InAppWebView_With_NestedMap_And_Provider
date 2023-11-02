import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mirrorwall/model/connetivity_model.dart';

class ConnectivityProvider extends ChangeNotifier {
  ConnectivityModel connectivityModel =
      ConnectivityModel(connectivity: 'offline');
  Connectivity connectivity = Connectivity();

  void CheckConnectivity() {
    connectivity.onConnectivityChanged.listen(
      (ConnectivityResult connectivityResult) {
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          connectivityModel.connectivity = 'online';
          notifyListeners();
        } else {
          connectivityModel.connectivity = 'offline';
          notifyListeners();
        }
      },
    );
  }
}
