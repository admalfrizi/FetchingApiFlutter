import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connect = Connectivity();
  final connectStream = StreamController<ConnectivityResult>();

  ConnectivityService() {
    _connect.onConnectivityChanged.listen((event) {
      connectStream.add(event);
    });
  }
}
