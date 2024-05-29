import 'package:acar/helpers/functions/snackbars.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

Future<bool> checkIntConn(BuildContext context) async {
  List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.first == ConnectivityResult.mobile ||
      connectivityResult.first == ConnectivityResult.wifi) {
    return true;
  } else {
    if (context.mounted) showIntConnErr(context);
    return false;
  }
}
