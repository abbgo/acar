import 'package:acar/helpers/functions/internet.dart';
import 'package:acar/providers/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var checkInternetConnProvider =
    FutureProvider.autoDispose.family<bool, BuildContext>((ref, arg) async {
  bool hasInternet = await checkIntConn(arg);
  if (!hasInternet) {
    ref.read(loadLoginProvider.notifier).state = false;
  }
  return hasInternet;
});
